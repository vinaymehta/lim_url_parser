require 'rails_helper'

RSpec.describe Api::ParserController, type: :controller do

  #save_content action
  describe "save_content action" do
    describe "when no url provided" do
      it 'should send error message when no url param provided' do
        post :save_content, format: :json
        expect(response.code).to be_eql("400")
        json = JSON.parse(response.body)
        expect(json['error']).to eq('Please provide Url!')
      end

      it 'should send error message when blank url param provided' do
        post :save_content, format: :json, url: ''
        expect(response.code).to be_eql("400")
        json = JSON.parse(response.body)
        expect(json['error']).to eq('Please provide Url!')
      end
    end

    describe "when url is provided" do
      it 'send error message if fake or invalid url provided' do
        post :save_content, format: :json, url: Faker::Internet.url
        expect(response.code).to be_eql("404")
        json = JSON.parse(response.body)
        expect(json['error']).to eq('Something went wrong! Please try again later')
      end

      it 'Save Url and its content when correct url provided' do
        post :save_content, format: :json, url: "http://berylsystems.com"
        expect(response.code).to be_eql("200")
        json = JSON.parse(response.body)
        expect(json['message']).to eq('Url Content Stored successfully.')
        expect(UrlContent.count).to be_eql(1)
      end
    end

    describe "when already present url is provided" do
      before do
        @record = create(:url_content, url: "http://berylsystems.com")
      end

      it 'should update old url record content' do
        post :save_content, format: :json, url: @record.url
        expect(response.code).to be_eql("200")
        json = JSON.parse(response.body)
        expect(json['message']).to eq('Url Content Stored successfully.')
        expect(UrlContent.count).to be_eql(1)
      end
    end
  end

  #index action
  describe "Index Action" do
    before do
      create(:url_content)
    end

    it 'get all stored records' do
      get :index, format: :json
      expect(response.code).to be_eql("200")
      json = JSON.parse(response.body)
      expect(json['error']).to eq(nil)
      expect(json['data'].length).to eq(1)
    end

    it 'get all stored urls and their content' do
      url = UrlContent.first
      get :index, format: :json
      json = JSON.parse(response.body)
      record = json['data'][0]
      expect(record['url']).to be_eql(url.url)
      expect(record['h1']).to be_eql(url.h1_content.split(','))
      expect(record['h2']).to be_eql(url.h2_content.split(','))
      expect(record['h3']).to be_eql(url.h3_content.split(','))
      expect(record['links']).to be_eql(url.link_content.split(','))
    end
  end

end

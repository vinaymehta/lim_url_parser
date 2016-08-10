class Api::ParserController < Api::MainController
  include Api::ParserHelper

  def save_content
    unless params[:url].blank?
      status, record = fetch_url_content(params[:url])
      if status
        render json: {data: UrlContentSerializer.new(record, root: false), message: flash[:notice]}, status: 200
      else
        render json: {error: flash[:notice] }, status: 404
      end
    else
      render json: {error: "Please provide Url!" }, status: 400
    end
  end

  def index
    urls = UrlContent.all
    results = urls.map{|url| UrlContentSerializer.new(url, root: false)}
    render :json => { :data => results}, status: 200
  end
end

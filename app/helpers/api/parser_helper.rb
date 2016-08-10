module Api::ParserHelper
  require 'open-uri'

  def fetch_url_content(url)
    status = true
    record = ''
    begin
      @doc = Nokogiri::HTML(open(url))
      h1_value = get_tag_content('h1')
      h2_value = get_tag_content('h2')
      h3_value = get_tag_content('h3')
      link_value = get_link_urls('a')
      #link_value = doc.css('a').text.encode!('UTF-8', 'UTF-8', :invalid => :replace).squish
      record = UrlContent.find_by_url(url)
      unless record.blank?
        record.update_attributes(h1_content: h1_value, h2_content: h2_value, h3_content: h3_value, link_content: link_value)
      else
        record = UrlContent.create(url: url, h1_content: h1_value, h2_content: h2_value, h3_content: h3_value, link_content: link_value)
      end
      flash[:notice] = "Url Content Stored successfully."
    rescue Exception => ex
      status = false
      puts ex
      flash[:notice] = "Something went wrong! Please try again later"
    end
    return status, record
  end

  def get_tag_content(tag)
    values = []
    @doc.css(tag).each do |val|
      values << val.text.encode!('UTF-8', 'UTF-8', :invalid => :replace).squish
    end
    return values.join(',')
  end

  def get_link_urls(tag)
    values = []
    @doc.css(tag).each do |val|
      values << val.attributes['href'].value
    end
    return values.join(',')
  end
end

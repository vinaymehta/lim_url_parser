class UrlContentSerializer < ActiveModel::Serializer
  attributes :url, :h1, :h2, :h3, :links

  def h1
    return object.h1_content.split(',')
  end

  def h2
    return object.h2_content.split(',')
  end

  def h3
    return object.h3_content.split(',')
  end

  def links
    return object.link_content.split(',')
  end
end

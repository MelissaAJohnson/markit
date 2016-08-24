module ApplicationHelper

require 'embedly'

  def display(url)
    embedly_api =Embedly::API.new :key => ENV['EMBEDLY_KEY']
    obj = embedly_api.oembed :url => url
    image_tag((obj.first.thumbnail_url).to_s.html_safe, size: "240x150", class: 'card-img-top')
    #(obj.first.html).to_s.html_safe --> see all page info
  end

  def page_title(url)
    embedly_api =Embedly::API.new :key => ENV['EMBEDLY_KEY']
    obj = embedly_api.oembed :url => url
    obj.first.title
  end
end

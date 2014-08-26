class ArticlesController < ApplicationController
  def index
    
  end

  def refresh
    Article.delete_all
    uri = URI.parse("https://www.discountlandlord.co.uk/news/feed/")
    response = Net::HTTP.get_response(uri)
    xmlDoc = REXML::Document.new response.body
    xmlDoc.elements.each('rss/channel/item') do |f| 
      Article.create(
        title: f.elements["title"].text,
        pubDate: DateTime.strptime(f.elements["pubDate"].text, "%a, %d %b %Y %H:%M:%S")
      )
    end
    redirect_to root_path
  end
end

require "open-uri"
require "nokogiri"

class QuotesScraping
  def initialize(tag, page = "1")
    @tag = tag
    @page = page
  end
  
    def call
      list = []
      doc = parsed_template("http://quotes.toscrape.com/tag/#{@tag}/page/#{@page}/")
      doc.css(".quote").each do |quote|
        quote_text = quote.css(".text").text
        author = quote.css(".author").text
        author_about = "http://quotes.toscrape.com" + quote.xpath("span[2]/a").first["href"]
        tags = quote.css(".tags").xpath("meta").first["content"].split(",")
        list.push(quote: quote_text, author: author, author_about: author_about, tags: tags)
      end 
      return list
    end
  
    private
      
    def parsed_template(url)
      return Nokogiri::HTML(open(url), nil, Encoding::UTF_8.to_s)
    end
end
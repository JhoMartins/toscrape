class QuotesCreatorJob < ApplicationJob
  queue_as :default

  def perform(quotes)
    quotes.each do |quote|
      tags = []
      quote[:tags].each do |tag|
        tags.push(Tag.find_or_create_by(name: tag))
      end
      Quote.create(quote.merge(tags: tags)) 
    end
  end
end

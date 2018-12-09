class QuotesController < ApplicationController
  def index
    tag = Tag.where(name: params[:search_tag]).first
    if tag.present?
      render json: tag.quotes.as_json(methods: :tags_serialized, except: [:_id, :tag_ids]) and return if tag.searched?
      tag.update(searched: true)
      render json: QuotesScraping.new(params[:search_tag]).call
    else
      Tag.create(name: params[:search_tag], searched: true)
      render json: QuotesScraping.new(params[:search_tag]).call
    end
  end
end

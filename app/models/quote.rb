class Quote
  include Mongoid::Document
    
  field :quote, type: String
  field :author, type: String
  field :author_about, type: String
  
  has_and_belongs_to_many :tags

  validates :quote, presence: :true, uniqueness: true
  validates :author, presence: true
  validates :author_about, presence: true
end
    
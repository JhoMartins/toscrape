class Tag
  include Mongoid::Document
  
  field :name, type: String
  field :searched, type: Boolean, default: false

  has_and_belongs_to_many :quotes

  validates :name, presence: :true, uniqueness: true
end
  
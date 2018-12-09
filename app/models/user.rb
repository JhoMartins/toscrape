class User
  include Mongoid::Document

  field :authentication_token, type: String, default: ""
  field :email, type: String, default: ""

  validates :email, presence: true, uniqueness: true,
    format: { with: /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/ }
  
  before_create :set_token

  private

  def set_token
    self.authentication_token = generate_token
  end
  
  def generate_token
    loop do
      token = SecureRandom.hex(32)
      break token unless User.where(authentication_token: token).exists?
    end
  end
end

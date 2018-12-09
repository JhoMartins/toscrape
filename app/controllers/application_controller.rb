class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  prepend_before_action :authenticate

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      User.where(authentication_token: token).present?
    end
  end
end

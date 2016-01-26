class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session


  skip_before_action :verify_authenticity_token, if: :json_request?


  protected

  def current_user
    authenticate_or_request_with_http_token do |token, options|
      @current_user = User.find_by(auth_token: token)
    end
  end

  def json_request?
    request.format.json?
  end

  def authenticate_or_request
    authenticate_or_request_with_http_token do |token, options|
      User.find_by(auth_token: token)
    end
  end

  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      User.find_by(auth_token: token)
    end
  end

  def authenticate_preview_realm
    authenticate_or_request_with_http_token('Preview') do |token, options|
      User.find_by(auth_token: token)
    end
  end

  def authenticate_banana_realm
    authenticate_token || render_unauthorized('Banana')
  end

  def render_unauthorized(realm=nil)
    if realm
      self.headers['WWW-Authenticate'] = %(Token realm="#{realm.gsub(/"/, "")}")
    end
    render json: 'Bad credentials', status: 401
  end

end

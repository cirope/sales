class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  before_action { Rack::MiniProfiler.authorize_request if admin? }

  def current_user
    @current_user ||= User.find_by(auth_token: cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  def authorize

    redirect_to_login unless current_user
  end

  def authorize_admin
    redirect_to_login unless admin?
  end

  def admin?
    current_user.kind_of? Admin
  end
  helper_method :admin?

  def redirect_to_login
    redirect_to login_url, alert: t('messages.not_authorized')
  end
end

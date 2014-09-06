class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  def set_to_english
    I18n.locale = :en
    set_session_and_redirect
  end

  def set_to_russian
    I18n.locale = :ru
    set_session_and_redirect
  end

  private

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end

  def set_session_and_redirect
    session[:locale] = I18n.locale
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to :root
  end
end

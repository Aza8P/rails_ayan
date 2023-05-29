class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers

  def set_locale
    if params[:locale].present? && I18n.available_locales.include?(params[:locale].to_sym)
      cookies.permanent[:locale] = params[:locale].to_sym
    else
      I18n.locale = cookies[:locale] || I18n.default_locale
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

end

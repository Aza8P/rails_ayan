class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  before_action :set_locale

  private

  def set_locale
    # Check if the locale is present in the params
    if params[:locale].present? && I18n.available_locales.include?(params[:locale].to_sym)
      # Store the locale in the session
      session[:locale] = params[:locale].to_sym
    end

    # Set the locale based on the stored value in the session or fallback to the default locale
    I18n.locale = session[:locale] || I18n.default_locale
  end
end

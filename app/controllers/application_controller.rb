class ApplicationController < ActionController::Base
    before_action :set_locale

    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end

  def default_url_options
    { locale: I18n.locale }
  end

  def locale
    locale = params[:locale].to_sym
    I18n.locale = locale if I18n.available_locales.include?(locale)
    head :ok
  end
end

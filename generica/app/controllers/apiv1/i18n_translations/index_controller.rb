class Apiv1::I18nTranslations::IndexController < ApplicationController
  def index
    render json: { translations: I18n.backend.send(:translations), locale: I18n.locale }
  end
end
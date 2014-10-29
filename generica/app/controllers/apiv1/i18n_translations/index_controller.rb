class Apiv1::I18nTranslations::IndexController < ApplicationController
  def index
    _force_all_lazy_translations_to_load  
    render json: { translations: I18n.backend.send(:translations), locale: I18n.locale }
  end
  private
  def _force_all_lazy_translations_to_load
    I18n.t :dog
  end

end
class Apiv1::Translations::CreateController < Admin::BaseController

  def create
    if _save_successful?
      render json: { translation: _translation_hash }
    else
      render json: { translation: _failure_hash }, status: :expectation_failed
    end
  end

  private
  def _save_successful?
    _translation.valid? && _translation.save!
  end

  def _translation
    @translation ||= Apiv1::Translation.find_or_create_by! _translation_params
  end

  def _translation_params
    params.require(:translation).permit(:key, :locale, :translated_text)
  end

  def _translation_hash
    _translation.attributes
  end

  def _failure_hash
    _translation.errors.to_h
  end
end
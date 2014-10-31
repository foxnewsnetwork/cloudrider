class Cloudrider::Apiv1::ProductsShowcaseComponent < Cloudrider::Apiv1::Base
  class Context
    def showcase_style
      :big_media
    end
  end
  private
  def _context
    Context.new
  end
end
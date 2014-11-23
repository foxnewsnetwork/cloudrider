class Cloudrider::Apiv1::OffersNewEmblem < Cloudrider::Apiv1::Base
  class Context
    def message_style
      :top
    end
  end

  private
  def _file_name
    "products/product/offers/new.emblem"
  end
  def _context
    Context.new
  end
end
class Cloudrider::Apiv1::ProductListingComponent < Cloudrider::Apiv1::Base
  class Context
    def listing_style
      :simple
    end
  end
  private
  def _context
    Context.new
  end
end
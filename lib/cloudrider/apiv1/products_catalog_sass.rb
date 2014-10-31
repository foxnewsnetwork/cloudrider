class Cloudrider::Apiv1::ProductsCatalogSass < Cloudrider::Apiv1::Base
  class Context
    def catalog_style
      :plain
    end
  end
  private
  def _context
    Context.new
  end
end
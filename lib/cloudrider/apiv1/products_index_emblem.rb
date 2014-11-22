class Cloudrider::Apiv1::ProductsIndexEmblem < Cloudrider::Apiv1::Base
  class Context
    attr_accessor :theme
  end
  private
  def _context
    Context.new.tap do |c|
      c.theme = @protosite.theme
    end
  end
end
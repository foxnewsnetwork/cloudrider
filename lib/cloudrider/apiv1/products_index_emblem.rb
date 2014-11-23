class Cloudrider::Apiv1::ProductsIndexEmblem < Cloudrider::Apiv1::Base
  class Context
    attr_accessor :theme
  end
  private
  def _file_name
    "products/index.emblem"
  end
  def _context
    Context.new.tap do |c|
      c.theme = @protosite.theme
    end
  end
end
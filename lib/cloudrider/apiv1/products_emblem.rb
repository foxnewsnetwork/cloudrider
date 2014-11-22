class Cloudrider::Apiv1::ProductsEmblem < Cloudrider::Apiv1::Base
  class Context
    def has_cookie_splash?
      false
    end
  end
  private
  def _context
    Context.new
  end
end
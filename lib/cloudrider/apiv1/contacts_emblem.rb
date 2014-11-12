class Cloudrider::Apiv1::ContactsEmblem < Cloudrider::Apiv1::Base
  class Context
    def products_first?
      false
    end
  end
  private
  def _context
    Context.new
  end
end
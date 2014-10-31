class Cloudrider::Apiv1::TableBoothsComponent < Cloudrider::Apiv1::Base
  class Context
    def booth_style
      :contact_form
    end
  end
  private
  def _context
    Context.new
  end
end
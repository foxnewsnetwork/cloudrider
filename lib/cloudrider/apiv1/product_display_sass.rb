class Cloudrider::Apiv1::ProductDisplaySass < Cloudrider::Apiv1::Base
  class Context
    def display_style
      :media_one
    end
  end
  private
  def _context
    Context.new
  end
end
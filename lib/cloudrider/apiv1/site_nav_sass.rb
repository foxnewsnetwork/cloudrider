class Cloudrider::Apiv1::SiteNavSass < Cloudrider::Apiv1::Base
  class Context
    def nav_style
      :top
    end
  end
  private
  def _context
    Context.new
  end
end
class Cloudrider::Apiv1::SiteNavComponent < Cloudrider::Apiv1::Base
  class Context
    def nav_style
      :top
    end
    def my_company_name
      "Cloudrider"
    end
  end

  private
  def _context
    Context.new
  end
end
class Cloudrider::Apiv1::SiteFooterSass < Cloudrider::Apiv1::Base
  class Context
    def my_company_name
      "Cloudrider"
    end
    def my_company_tagline
      "Some sort of company tagline"
    end
  end

  private
  def _context
    Context.new
  end
end
class Cloudrider::Apiv1::SiteFooterComponent < Cloudrider::Apiv1::Base
  class Context
    attr_accessor :my_company_name, :my_company_tagline
  end

  private
  def _context
    Context.new.tap do |c|
      if @protosite.present?
        c.my_company_name = @protosite.project_name
        c.my_company_tagline = "Some sort of company tagline"
      end
    end
  end
end
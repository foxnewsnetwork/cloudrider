class Cloudrider::Apiv1::SiteNavComponent < Cloudrider::Apiv1::Base
  class Context
    attr_accessor :nav_style
    def my_company_name
      "Cloudrider"
    end
  end

  private
  def _context
    Context.new.tap do |c|
      c.nav_style = (@style || :material).to_sym
    end
  end
end
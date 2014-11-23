class Cloudrider::Apiv1::SiteFooterSass < Cloudrider::Apiv1::Base
  class Context
  end

  private
  def _context
    Context.new
  end
end
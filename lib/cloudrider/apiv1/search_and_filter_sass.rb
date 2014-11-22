class Cloudrider::Apiv1::SearchAndFilterSass < Cloudrider::Apiv1::Base
  class Context
    attr_accessor :snf_style
  end
  private
  def _context
    Context.new.tap do |c|
      c.snf_style = (@style || :lefttop).to_s
    end
  end
end
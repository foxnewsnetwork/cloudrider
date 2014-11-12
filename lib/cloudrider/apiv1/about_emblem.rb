class Cloudrider::Apiv1::AboutEmblem < Cloudrider::Apiv1::Base
  class Context
    attr_accessor :index_style
  end
  private
  def _context
    Context.new.tap do |c|
      c.index_style = (@style || :pages).to_sym
    end
  end
end
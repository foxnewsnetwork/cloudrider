class Cloudrider::Apiv1::IndexRouteEmber < Cloudrider::Apiv1::Base
  class Context
    attr_accessor :index_style
  end
  private
  def _folder
    "app/assets/javascripts/templates/routes"
  end
  def _source_folder
    "app/varissets/javascripts/templates/routes"
  end
  def _context
    Context.new.tap do |c|
      c.index_style = (@style || :pages).to_sym
    end
  end
end
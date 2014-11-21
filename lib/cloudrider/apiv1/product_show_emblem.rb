class Cloudrider::Apiv1::ProductShowEmblem < Cloudrider::Apiv1::Base
  class Context
    attr_accessor :show_style
    def online_offerable?
      case show_style.to_s
      when "ecommerce"
        true
      else
        false
      end
    end
  end
  private
  def _file_name
    "show.emblem"
  end
  def _source_folder
    "app/varissets/javascripts/templates/products/product"
  end
  def _context
    Context.new.tap do |c|
      c.show_style = @style
    end
  end
end
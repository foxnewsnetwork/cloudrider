class Cloudrider::Apiv1::LoginModalEmblem < Cloudrider::Apiv1::Base
  class Context
    attr_accessor :login_style
    def registerable?
      case login_style.to_s
      when "ecommerce", "registerable"
        true
      else
        false
      end
    end
  end
  private
  def _file_name
    "login.emblem"
  end
  def _source_folder
    "app/varissets/javascripts/templates/modals"
  end
  def _context
    Context.new.tap do |c|
      c.login_style = @style
    end
  end
end
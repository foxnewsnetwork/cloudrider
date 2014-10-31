class Cloudrider::Apiv1::HeroSplashComponent < Cloudrider::Apiv1::Base
  class Context
    def hero_style
      :static
    end
    def my_company_name
      "Cloudrider"
    end
    def company_pre_tagline
      "wore it for Ascot"
    end
    def company_tagline
      "Poirot retreated to the background"
    end
  end

  def protofile
    Cloudrider::Protofile.new.tap do |p|
      p.file_name = "hero-splash.emblem"
      p.folder = "app/assets/javascripts/templates/components"
      p.renderer = _renderer
    end
  end
  private
  def _renderer
    -> { _template.render _context }
  end
  def _template
    @template ||= Tilt::ERBTemplate.new _source
  end
  def _source
    File.join Cloudrider::Apiv1.source_root, "app", "varissets", "javascripts", "templates", "components", "hero-splash.emblem.erb"
  end
  def _context
    Context.new
  end
end
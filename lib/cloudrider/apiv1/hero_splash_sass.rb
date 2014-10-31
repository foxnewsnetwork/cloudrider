class Cloudrider::Apiv1::HeroSplashSass
  class Context
    def hero_style
      :static
    end
    def background_image_url
      "url(hero-splash/albatross.jpg)"
    end
    def background_min_height
      "45rem"
    end
    def splash_cta_bgcolor
      "white"
    end
    def tag_text_align
      "left"
    end
    def tag_text_color
      "#444" # should contrast cta_bgcolor
    end
  end

  def protofile
    Cloudrider::Protofile.new.tap do |p|
      p.file_name = "_hero-splash.css.scss"
      p.folder = "app/assets/stylesheets/apiv1/components"
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
    File.join Cloudrider::Apiv1.source_root, "app", "varissets", "stylesheets", "apiv1", "components", "_hero-splash.css.scss.erb"
  end
  def _context
    Context.new
  end
end
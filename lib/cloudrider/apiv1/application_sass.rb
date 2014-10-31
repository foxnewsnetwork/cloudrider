class Cloudrider::Apiv1::ApplicationSass
  class Context
    def body_background_color
      '#eee'
    end
    def modal_background_color
      'fade-out(#000, 0.8)'
    end
  end

  def protofile
    Cloudrider::Protofile.new.tap do |p|
      p.file_name = "_application.css.scss"
      p.folder = "app/assets/stylesheets/apiv1"
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
    File.join Cloudrider::Apiv1.source_root, "app", "varissets", "stylesheets", "apiv1", "_application.css.scss.erb"
  end
  def _context
    Context.new
  end
end
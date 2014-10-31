class Cloudrider::Apiv1::ApplicationEmblem
  class Context
    def nav_style
      :top
    end
  end

  def protofile
    Cloudrider::Protofile.new.tap do |p|
      p.file_name = "application.emblem"
      p.folder = "app/assets/javascripts/templates"
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
    File.join Cloudrider::Apiv1.source_root, "app", "varissets", "javascripts", "templates", "application.emblem.erb"
  end
  def _context
    Context.new
  end
end
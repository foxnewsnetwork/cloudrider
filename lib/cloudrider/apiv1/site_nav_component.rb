class Cloudrider::Apiv1::SiteNavComponent
  class Context
    def nav_style
      :top
    end
    def my_company_name
      "Cloudrider"
    end
  end

  def protofile
    Cloudrider::Protofile.new.tap do |p|
      p.file_name = "site-nav.emblem"
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
    File.join Cloudrider::Apiv1.source_root, "app", "varissets", "javascripts", "templates", "components", "site-nav.emblem.erb"
  end
  def _context
    Context.new
  end
end
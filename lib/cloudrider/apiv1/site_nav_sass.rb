class Cloudrider::Apiv1::SiteNavSass < Cloudrider::Apiv1::Base
  class Context
    attr_accessor :nav_style
    def render(template: template, context: context)
      Tilt::ERBTemplate.new(_source _normalize template).render context
    end
    private
    def _normalize(template)
      template.split("/").head.push _unpartialize _extensionify template.split("/").last
    end
    def _unpartialize(filename)
      filename.gsub /^_*/, '_'
    end
    def _extensionify(filename)
      filename.gsub /\.css\.scss\.erb$/, ".css.scss.erb"
    end
    def _source(template)
      File.join Cloudrider.root, "generica", "app", "varissets", template
    end
  end
  private
  def _context
    Context.new.tap do |c|
      c.nav_style = (@style || :material).to_sym
    end
  end
end
class Cloudrider::Serverside::NginxConf < Cloudrider::Serverside::Base
  class Context
    attr_accessor :web_urls, :project_name
  end

  private
  def _file_name
    "nginx.conf"
  end
  def _context
    Context.new.tap do |c|
      c.web_urls = @style.split(" ").tail
      c.project_name = @style.split(" ").first
    end
  end
end
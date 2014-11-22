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
      if @style.present?
        c.web_urls = @style.tail
        c.project_name = @style.first
      else
        c.web_urls = @protosite.domain_names
        c.project_name = @protosite.project_name
      end
    end
  end
end
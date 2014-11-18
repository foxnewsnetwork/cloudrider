class Cloudrider::Serverside::DatabaseYaml < Cloudrider::Serverside::Base
  class Context
    attr_accessor :web_urls, :project_name
  end
  private
  def _file_name
    "database.yml"
  end
  def _context
    Context.new.tap do |c|
      c.web_urls = @style.split(" ").tail
      c.project_name = @style.split(" ").first
    end
  end
  
end
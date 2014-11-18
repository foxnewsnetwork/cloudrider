class Cloudrider::Serverside::DatabaseYaml < Cloudrider::Serverside::Base
  class Context
    attr_accessor :project_name
  end
  private
  def _file_name
    "database.yml"
  end
  def _context
    Context.new.tap do |c|
      c.project_name = @style.first
    end
  end
  def _template
    @template ||= Tilt::StringTemplate.new _source
  end
  def _source_file
    _file_name + ".str"
  end
end
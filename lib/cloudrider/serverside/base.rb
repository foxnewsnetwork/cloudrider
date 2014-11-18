class Cloudrider::Serverside::Base
  def initialize(style=[])
    @style = style
  end
  def protofile
    Cloudrider::Protofile.new.tap do |p|
      p.file_name = _file_name
      p.folder = _folder
      p.renderer = _renderer
    end
  end
  private
  def _file_name
    throw "not implemented"
  end
  def _folder
    "config"
  end
  def _renderer
    -> { _template.render _context }
  end
  def _template
    @template ||= Tilt::ERBTemplate.new _source
  end
  def _source
    File.join Cloudrider::Serverside.source_root, _source_folder, _source_file
  end
  def _source_folder
    "config"
  end
  def _source_file
    _file_name + ".erb"
  end
end
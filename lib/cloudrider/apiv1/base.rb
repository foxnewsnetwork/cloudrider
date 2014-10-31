class Cloudrider::Apiv1::Base
  class UnknownFileExtension < StandardError; end
  class UnknownFamilyResidence < StandardError; end
  def initialize(style=nil)
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
  def _folder
    case _family
    when :component
      "app/assets/javascripts/templates/components"
    when :sass
      "app/assets/stylesheets/apiv1/components"
    when :emblem
      "app/assets/javascripts/templates"
    else
      raise UnknownFamilyResidence, _family
    end
  end
  def _family
    Cloudrider::Apiv1.family_from_class_name self.class
  end
  def _source_file
    _file_name + ".erb"
  end
  def _source_folder
    case _family
    when :component
      "app/varissets/javascripts/templates/components"
    when :sass
      "app/varissets/stylesheets/apiv1/components"
    when :emblem
      "app/varissets/javascripts/templates"
    else
      raise UnknownFamilyResidence, _family
    end
  end
  def _file_name
    [_file_name_from_class, _file_ext_from_class].join ""
  end
  def _file_name_from_class
    Cloudrider::Apiv1.file_name_from_class_name self.class
  end
  def _file_ext_from_class
    Cloudrider::Apiv1.file_ext_from_class_name self.class
  end
  def _renderer
    -> { _template.render _context }
  end
  def _template
    @template ||= Tilt::ERBTemplate.new _source
  end
  def _source
    File.join Cloudrider::Apiv1.source_root, _source_folder, _source_file
  end
end
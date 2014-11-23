class Cloudrider::Protofile
  class OnlyBeCalledWhenNoType < StandardError; end
  attr_accessor :file_name, :folder, :renderer, :source, :target, :type
  def initialize(opts={})
    @type = opts[:type]
    @source = opts[:source]
    @target = opts[:target]
  end
  def full_name
    raise OnlyBeCalledWhenNoType, _debug_string if ["copy_file", "directory"].include? @type.to_s
    File.join *[folder, file_name].reject(&:blank?)
  end
  def content
    renderer.call
  end
  private
  def _debug_string
    {
      file_name: file_name,
      folder: folder,
      target: target,
      type: type
    }.inspect
  end
end
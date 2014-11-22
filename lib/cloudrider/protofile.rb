class Cloudrider::Protofile
  attr_accessor :file_name, :folder, :renderer, :source, :target, :type
  def initialize(opts={})
    @type = opts[:type]
    @source = opts[:source]
    @target = opts[:target]
  end
  def full_name
    File.join folder, file_name
  end
  def content
    renderer.call
  end
end
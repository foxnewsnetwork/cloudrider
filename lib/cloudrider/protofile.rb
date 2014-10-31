class Cloudrider::Protofile
  attr_accessor :file_name, :folder, :renderer
  def full_name
    File.join folder, file_name
  end
  def content
    renderer.call
  end
end
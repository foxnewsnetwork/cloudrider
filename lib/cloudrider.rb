require "cloudrider/version"
module Cloudrider
  Dir[File.join(__dir__, "cloudrider", "*.rb")].each { |f| require f }
  def self.root
    File.expand_path "../..", __FILE__
  end
end

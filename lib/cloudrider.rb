require "cloudrider/version"
module Cloudrider
  require "cloudrider/application_commander"
  def self.root
    File.expand_path "../..", __FILE__
  end
end

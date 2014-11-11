require "cloudrider/version"
module Cloudrider
  require "cloudrider/application_commander"
  def self.root
    File.expand_path "../../generica", __FILE__
  end
end

require "tilt"
require "erb"
require 'active_support'
require "active_support/core_ext"
require "functional_support"
module Cloudrider; end
module Cloudrider::Serverside
  require File.join(__dir__, "serverside", "base.rb")
  Dir[File.join(__dir__, "serverside", "*.rb")].each { |f| require f }

  class << self
    def source_root
      File.expand_path "../../../generica", __FILE__
    end
  end
end
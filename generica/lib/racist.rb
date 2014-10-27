module Racist
  require File.join __dir__, "racist", "bouncer"
  class << self
    def permits(opts)
      Racist::Bouncer.new opts
    end
  end
end
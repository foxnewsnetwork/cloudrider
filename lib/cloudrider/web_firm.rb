module Cloudrider
  module WebFirm
    class Slave
      def initialize(protosite)
        @protosite = protosite
      end
    end
    Dir[File.join(__dir__, "web_firm", "*.rb")].each { |f| require f }
    class << self
      def make_me_a_fucking_website_you_shit(protosite)
        Cloudrider::WebFirm::ProjectLead.new(protosite).protofiles
      end
    end
  end
end
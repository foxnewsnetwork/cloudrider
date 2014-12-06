class Cloudrider::Serverside::SquashRuby < Cloudrider::Serverside::Base
  class Context
    attr_accessor :api_key
  end
  private
  def _file_name
    "initializers/squash.rb"
  end
  def _context
    Context.new.tap do |c|
      c.api_key = @protosite.squash_api_key
    end
  end
end
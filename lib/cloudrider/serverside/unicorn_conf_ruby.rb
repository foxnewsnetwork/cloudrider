class Cloudrider::Serverside::UnicornConfRuby < Cloudrider::Serverside::Base
  class Context
    attr_accessor :project_name
  end

  private
  def _file_name
    "unicorn.conf.rb"
  end

  def _context
    Context.new.tap do |c|
      c.project_name = @style.first
    end
  end

end
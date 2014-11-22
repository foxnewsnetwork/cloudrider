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
      c.project_name = @style.first if @style.present?
      c.project_name = @protosite.project_name if @protosite.present?
    end
  end

end
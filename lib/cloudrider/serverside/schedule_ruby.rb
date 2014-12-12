class Cloudrider::Serverside::ScheduleRuby < Cloudrider::Serverside::Base
  class Context
    attr_accessor :project_name
  end
  private
  def _file_name
    "schedule.rb"
  end
  def _context
    Context.new.tap do |c|
      c.project_name = @protosite.project_name
    end
  end
end
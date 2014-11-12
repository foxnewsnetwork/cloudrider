class Cloudrider::Apiv1::MessagesNewEmblem < Cloudrider::Apiv1::Base
  class Context
    def message_style
      :top
    end
  end

  private
  def _file_name
    "messages/new.emblem"
  end
  def _context
    Context.new
  end
end
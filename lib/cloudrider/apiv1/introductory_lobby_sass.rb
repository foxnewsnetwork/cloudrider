class Cloudrider::Apiv1::IntroductoryLobbySass < Cloudrider::Apiv1::Base
  class Context
    def title_text_color
      '#333'
    end
    def abstract_text_color
      '#333'
    end
    def lobby_style
      :center_plain
    end
  end
  private
  def _context
    Context.new
  end
end
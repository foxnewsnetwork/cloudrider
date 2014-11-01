class Cloudrider::Apiv1::IntroductoryLobbyComponent < Cloudrider::Apiv1::Base
  class Context
    def lobby_style
      :center_plain
    end
    def about_us_sentences
      about_us.split(/\.\s*/)
    end
    def about_us
      "But, like most politicians, he promised more than he could deliver. We need rest. The spirit is willing, but the flesh is spongy and bruised. We'll go deliver this crate like professionals, and then we'll go home. Oh, I think we should just stay friends. Bender, you risked your life to save me! I haven't felt much of anything since my guinea pig died."
    end
    
  end
  private
  def _context
    Context.new
  end
end
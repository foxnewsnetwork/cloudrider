class Cloudrider::Apiv1::ProductsShowcaseSass < Cloudrider::Apiv1::Base
  class Context
    def showcase_style
      :big_media
    end
    def post_note_background_url
      "url(hero-splash/rocks.jpg)"
    end
    def post_note_background_size
      "cover"
    end
    def post_note_background_position
      "center center"
    end
  end
  private
  def _context
    Context.new
  end
end
class Cloudrider::Apiv1::CookieSplashSass < Cloudrider::Apiv1::Base
  class Context
    def splash_style
      :wechat
    end
    def background_image_url
      "url(cookie-splash/albatross.jpg)"
    end
    def background_image_size
      "cover"
    end
    def background_image_position
      "bottom center"
    end
  end
  private
  def _context
    Context.new
  end
end
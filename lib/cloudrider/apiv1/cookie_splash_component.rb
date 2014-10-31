class Cloudrider::Apiv1::CookieSplashComponent < Cloudrider::Apiv1::Base
  class Context
    def icon_image_url
      "assets/cookie-splash/california.png"
    end
    def splash_style
      :wechat
    end
  end
  private
  def _context
    Context.new
  end
end
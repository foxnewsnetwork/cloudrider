class Cloudrider::MasterContext
  attr_accessor :company_names, :company_slogans, :about_company, :contact_company, :showcase_pictures

  def application_emblem
    Cloudrider::Apiv1::ApplicationEmblem::Context.new.tap do |c|
      c.nav_style = [:left, :top].sample
    end
  end
  def cookie_splash_component
    Cloudrider::Apiv1::CookieSplashComponent::Context.new.tap do |c|
      c.icon_image_url = "assets/cookie-splash/california.png"
      c.splash_style = :wechat
    end
  end
  def hero_splash_sass
    Cloudrider::Apiv1::HeroSplashSass::Context.new.tap do |c|
      c.hero_style = :static
      c.background_image_url = "url(hero-splash/albatross.jpg)"
      c.background_min_height = "45rem"
      c.splash_cta_bgcolor = "white"
      c.tag_text_align = "left"
      c.tag_text_color = "#444"
    end
  end
  def introductory_lobby_sass
    Cloudrider::Apiv1::IntroductoryLobbySass::Context.new.tap do |c|
      c.title_text_color = '#333'
      c.abstract_text_color = '#333'
      c.lobby_style = :center_plain
      c.background_image_url  = "url(introductory-lobby/fishing.jpg)"
      c.background_image_size = "cover"
      c.background_image_position = "bottom left"
    end
  end
  def product_listing_component
    Cloudrider::Apiv1::ProductListingComponent.new.tap do |c|
      c.listing_style = :simple
    end
  end
  def products_catalog_sass
    Cloudrider::Apiv1::ProductsCatalogSass.new.tap do |c|
      c.catalog_style = :plain
    end
  end
  def site_footer_component
    Cloudrider::Apiv1::SiteFooterComponent.new.tap do |c|
      c.my_company_name = "Cloudrider"
      c.my_company_tagline = "Some sort of company tagline"
    end
  end
  def table_booths_component
    Cloudrider::Apiv1::TableBoothsComponent.new.tap do |c|
      c.booth_style = :contact_form
      c.main_contact_email  = "terricapo@gmail.com"
      c.contact_us_call_to_action = "are you a wholesale buyer?"
    end
  end
  def application_sass
    Cloudrider::Apiv1::ApplicationSass.new.tap do |c|
      c.body_background_color = '#eee'
      c.modal_background_color = 'fade-out(#000, 0.8)'
    end
  end
  def cookie_splash_sass
    Cloudrider::Apiv1::CookieSplashSass.new.tap do |c|
      
    end
  end
  def index_emblem

  end
  def product_display_component

  end
  def product_listing_sass

  end
  def products_showcase_component

  end
  def site_nav_component

  end
  def table_booths_sass

  end
  def hero_splash_component

  end
  def introductory_lobby_component

  end
  def product_display_sass

  end
  def products_catalog_component

  end
  def products_showcase_sass

  end
  def site_nav_sass

  end
end

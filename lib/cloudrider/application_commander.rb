require "cloudrider/apiv1"
require "cloudrider/protofile"
class Cloudrider::ApplicationCommander
  class UnknownOrUnimplmenetedVarisset < StandardError; end
  class << self
    def varisset_protofiles_for(params)
      new(params).files_to_write
    end
  end
  def initialize(params)
    @params = params
  end

  def files_to_write
    _related_assets.flatten.map(&:new).map(&:protofile)
  end

  private
  def _product_display
    [Cloudrider::Apiv1::ProductDisplayComponent, Cloudrider::Apiv1::ProductDisplaySass]
  end
  def _application
    [Cloudrider::Apiv1::ApplicationSass, Cloudrider::Apiv1::ApplicationEmblem]
  end
  def _hero_splash
    [Cloudrider::Apiv1::HeroSplashSass, Cloudrider::Apiv1::HeroSplashComponent]
  end
  def _introductory_lobby
    [Cloudrider::Apiv1::IntroductoryLobbySass, Cloudrider::Apiv1::IntroductoryLobbyComponent]
  end
  def _product_listing
    [Cloudrider::Apiv1::ProductListingComponent, Cloudrider::Apiv1::ProductListingSass]
  end
  def _varisset_name
    @params[:name]
  end
  def _related_assets
    case _varisset_name
    when "product-display"
      _product_display
    when "product-listing"
      _product_listing
    when "application"
      _application
    when "hero-splash"
      _hero_splash
    when "introductory-lobby"
      _introductory_lobby
    else
      raise UnknownOrUnimplmenetedVarisset, _varisset_name
    end
  end
  KnownVarissets = [
    "application",
    "index",
    "cookie-splash",
    "hero-splash",
    "introductory-lobby",
    "product-display",
    "product-listing",
    "products-catalog",
    "products-showcase",
    "site-nav",
    "table-booths"
  ]
end


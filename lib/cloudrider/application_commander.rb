require "cloudrider/apiv1"
require "cloudrider/protofile"
class Cloudrider::ApplicationCommander
  class UnknownOrUnimplmenetedVarisset < StandardError; end
  class << self
    def varisset_protofiles_for(params)
      new(params).files_to_write
    end
    def all_varissets
      new(name: :all).all_files
    end
  end
  def initialize(params)
    @params = params
  end

  def files_to_write
    _related_assets.flatten.map { |ac| ac.new _varisset_style }.map(&:protofile)
  end

  def all_files
    [ 
      _product_display,
      _application,
      _hero_splash,
      _introductory_lobby,
      _product_listing,
      _index,
      _cookie_splash,
      _products_catalog,
      _products_showcase,
      _site_nav,
      _table_booths,
      _site_footer
    ].flatten.map { |ac| ac.new _varisset_style }.map(&:protofile)
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
  def _index
    [Cloudrider::Apiv1::IndexEmblem]
  end
  def _cookie_splash
    [Cloudrider::Apiv1::CookieSplashComponent, Cloudrider::Apiv1::CookieSplashSass]
  end
  def _products_catalog
    [Cloudrider::Apiv1::ProductsCatalogComponent, Cloudrider::Apiv1::ProductsCatalogSass]
  end
  def _products_showcase
    [Cloudrider::Apiv1::ProductsShowcaseComponent, Cloudrider::Apiv1::ProductsShowcaseSass]
  end
  def _site_nav
    [Cloudrider::Apiv1::SiteNavComponent, Cloudrider::Apiv1::SiteNavSass]
  end
  def _table_booths
    [Cloudrider::Apiv1::TableBoothsComponent, Cloudrider::Apiv1::TableBoothsSass]
  end
  def _site_footer
    [Cloudrider::Apiv1::SiteFooterComponent]
  end
  def _varisset_name
    @params[:name]
  end
  def _varisset_style
    @params[:style]
  end
  def _related_assets
    case _varisset_name
    when "application"
      _application
    when "index"
      _index
    when "cookie-splash"
      _cookie_splash
    when "hero-splash"
      _hero_splash
    when "introductory-lobby"
      _introductory_lobby
    when "product-display"
      _product_display
    when "product-listing"
      _product_listing
    when "products-catalog"
      _products_catalog
    when "products-showcase"
      _products_showcase
    when "site-footer"
      _site_footer
    when "site-nav"
      _site_nav
    when "table-booths"
      _table_booths
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
    "site-footer",
    "table-booths"
  ]
end


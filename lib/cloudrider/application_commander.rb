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
    _related_assets.flatten.map { |ac| ac.new style: _varisset_style, protosite: _protosite }.map(&:protofile)
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
    [
      Cloudrider::Apiv1::IndexEmblem, 
      Cloudrider::Apiv1::AboutEmblem, 
      Cloudrider::Apiv1::ContactsEmblem,
      Cloudrider::Apiv1::IndexRouteEmber
    ]
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
    [
      Cloudrider::Apiv1::TableBoothsComponent, 
      Cloudrider::Apiv1::TableBoothsSass, 
      Cloudrider::Apiv1::EmployeesIndexEmblem,
      Cloudrider::Apiv1::MessagesNewEmblem
    ]
  end
  def _site_footer
    [Cloudrider::Apiv1::SiteFooterComponent, Cloudrider::Apiv1::SiteFooterSass]
  end
  def _offers_new
    [Cloudrider::Apiv1::OffersNewEmblem, Cloudrider::Apiv1::OffersAnonymousFormPartial, Cloudrider::Apiv1::OffersFormPartial]
  end
  def _product_show
    [Cloudrider::Apiv1::ProductShowEmblem]
  end
  def _products_index
    [Cloudrider::Apiv1::ProductsIndexEmblem, Cloudrider::Apiv1::ProductsEmblem]
  end
  def _offers_overview
    [Cloudrider::Apiv1::OffersOverviewComponent, Cloudrider::Apiv1::OffersOverviewSass]
  end
  def _search_and_filter
    [Cloudrider::Apiv1::SearchAndFilterComponent, Cloudrider::Apiv1::SearchAndFilterSass]
  end
  def _protosite
    @params[:protosite]
  end
  def _varisset_name
    @params[:name]
  end
  def _varisset_style
    @params[:style]
  end
  def _related_assets
    case _varisset_name.underscore
    when "application"
      _application
    when "index"
      _index
    when "cookie_splash"
      _cookie_splash
    when "hero_splash"
      _hero_splash
    when "introductory_lobby"
      _introductory_lobby
    when "product_display"
      _product_display
    when "product_listing"
      _product_listing
    when "products_catalog"
      _products_catalog
    when "products_showcase"
      _products_showcase
    when "site_footer"
      _site_footer
    when "site_nav"
      _site_nav
    when "table_booths"
      _table_booths
    when "product_show"
      _product_show
    when "products_index"
      _products_index
    when "offers_overview"
      _offers_overview
    when "offers_new"
      _offers_new
    when "search_and_filter"
      _search_and_filter
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
    "table-booths",
    "product-show",
    "products-index",
    "offers-overview",
    "search-and-filter"
  ]
end


require 'tilt'
require 'erb'
class Cloudrider::FileOrdersMaker
  def initialize(hash)
    @request = hash
  end

  def file_orders
    _website_application
  end

  private
  def _website_application
    WebsiteIndexPage.new.tap do |w|
      w.site_nav = Cloudrider::EmberApp::SiteNav.new @request
      w.hero_splash = Cloudrider::EmberApp::HeroSplash.new @request
      w.introductory_lobby = Cloudrider::EmberApp::IntroductoryLobby.new @request
      w.products_showcase = Cloudrider::EmberApp::ProductsShowcase.new @request
      w.table_booths = Cloudrider::EmberApp::TableBooths.new @request
    end
  end


end
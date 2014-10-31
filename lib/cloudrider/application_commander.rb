require "cloudrider/apiv1"
require "cloudrider/protofile"
class Cloudrider::ApplicationCommander
  def initialize(params={})
    @params = params
  end

  def files_to_write
    [_emblems, _components, _sasses].flatten
  end

  def files_to_append
    []
  end

  private
  def _normalized_options
    @normalized_options ||= @params
  end
  def _emblems
    [Cloudrider::Apiv1::ApplicationEmblem].map(&:new).map(&:protofile)
  end
  def _sasses
    [
      Cloudrider::Apiv1::ApplicationSass,
      Cloudrider::Apiv1::HeroSplashSass,
      Cloudrider::Apiv1::IntroductoryLobbySass
    ].map(&:new).map(&:protofile)
  end
  def _components
    [
      Cloudrider::Apiv1::SiteNavComponent, 
      Cloudrider::Apiv1::HeroSplashComponent,
      Cloudrider::Apiv1::IntroductoryLobbyComponent
    ].map(&:new).map(&:protofile)
  end
end


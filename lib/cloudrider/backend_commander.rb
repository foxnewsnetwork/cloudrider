require "cloudrider/serverside"
require "cloudrider/protofile"
module Cloudrider; end
class Cloudrider::BackendCommander
  class UnknownOrUnimplmenetedVarisset < StandardError; end
  class << self
    def backend_ruby_protofiles_for(params)
      new(params).files_to_write
    end
  end

  def initialize(params)
    @params = params
  end

  def files_to_write
    _related_backends.flatten.map { |ac| ac.new style: _backend_style, protosite: _protosite }.map(&:protofile)
  end
  private
  def _nginx
    [Cloudrider::Serverside::NginxConf]
  end
  def _unicorn
    [Cloudrider::Serverside::UnicornConfRuby]
  end
  def _database
    [Cloudrider::Serverside::DatabaseYaml]
  end
  def _squash
    [Cloudrider::Serverside::SquashRuby]
  end
  def _schedule
    [Cloudrider::Serverside::ScheduleRuby]
  end
  def _configs
    _nginx + _unicorn + _database + _squash + _schedule
  end
  def _related_backends
    case _backend_name
    when "configs"
      _configs
    when "nginx"
      _nginx
    when "unicorn"
      _unicorn
    when "database"
      _database
    when "squash"
      _squash
    when "schedule"
      _schedule
    else
      raise UnknownOrUnimplmenetedVarisset, _backend_name
    end
  end
  def _protosite
    @params[:protosite]
  end
  def _backend_style
    @params[:style]
  end
  def _backend_name
    @params[:name]
  end
  KnownBackends = ["configs", "nginx", "unicorn", "database", "squash"]
end
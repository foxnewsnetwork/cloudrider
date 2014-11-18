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
    _related_backends.flatten.map { |ac| ac.new _backend_style }.map(&:protofile)
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
  def _related_backends
    case _backend_name
    when "admin"
    when "user"
    when "employee"
    when "product"
    when "offer"
    when "message"
    when "taxon"
    when "nginx"
      _nginx
    when "unicorn"
      _unicorn
    when "database"
      _database
    else
      raise UnknownOrUnimplmenetedVarisset, _backend_name
    end
  end
  def _backend_style
    @params[:style]
  end
  def _backend_name
    @params[:name]
  end
  KnownBackends = ["admin", "user", "employee", "product", "offer", "message", "taxon", "nginx", "unicorn", "database"]
end
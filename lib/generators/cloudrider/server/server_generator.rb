require "cloudrider/backend_commander"

module Cloudrider::Generators; end
class Cloudrider::Generators::ServerGenerator < Rails::Generators::NamedBase

  desc "Generates backend server rubies and conf files and puts them into their right places.
  Known backend files are: #{Cloudrider::BackendCommander::KnownBackends}"
  def create_the_variable_files
    _selective_backend_rubies
  end
  private
  def _selective_backend_rubies
    Cloudrider::BackendCommander.backend_ruby_protofiles_for(_backend_ruby_opts).each do |protofile|
      create_file protofile.full_name, protofile.content
    end
  end
  def _all_backend_rubies?
    _backend_ruby_name == "all"
  end
  def _backend_ruby_opts
    { name: _backend_ruby_name, style: _backend_ruby_style }
  end
  def _backend_ruby_name
    name.split(":").first
  end
  def _backend_ruby_style
    name.split(":").second
  end
end
require "cloudrider/application_commander"

module Cloudrider::Generators; end
class Cloudrider::Generators::VarissetsGenerator < Rails::Generators::NamedBase

  desc "Generates a varying asset and inserts it properly into your application.
  Known varissets are: #{Cloudrider::ApplicationCommander::KnownVarissets}"  
  def create_the_variable_files
    Cloudrider::ApplicationCommander.varisset_protofiles_for(_varisset_opts).each do |protofile|
      create_file protofile.full_name, protofile.content
    end
  end
  private
  def _varisset_opts
    { name: _varisset_name, style: _varisset_style }
  end
  def _varisset_name
    name.split(":").first
  end
  def _varisset_style
    name.split(":").second
  end
end
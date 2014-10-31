require "cloudrider/application_commander"

module Cloudrider::Generators; end
class Cloudrider::Generators::VarissetsGenerator < Rails::Generators::NamedBase

  desc "Generates a varying asset and inserts it properly into your application.
  Known varissets are: #{Cloudrider::ApplicationCommander::KnownVarissets}"  
  def create_the_variable_files
    return _all_varissets if _all_varissets?
    _selective_varissets
  end
  private
  def _selective_varissets
    Cloudrider::ApplicationCommander.varisset_protofiles_for(_varisset_opts).each do |protofile|
      create_file protofile.full_name, protofile.content
    end
  end
  def _all_varissets
    Cloudrider::ApplicationCommander.all_varissets.each do |protofile|
      create_file protofile.full_name, protofile.content
    end
  end
  def _all_varissets?
    _varisset_name == "all"
  end
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
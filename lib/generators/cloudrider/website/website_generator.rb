require "cloudrider/web_firm"
module Cloudrider::Generators; end
class Cloudrider::Generators::WebsiteGenerator < Rails::Generators::NamedBase
  source_root File.expand_path "../../../../../generica", __FILE__
  desc "Builds a website when given a json file specifying the desired functionalities and such"
  def create_the_variable_files
    _protofiles.each do |protofile|
      case protofile.type.to_s
      when "copy_file"
        copy_file protofile.source, protofile.target
      when "directory"
        directory protofile.source, protofile.target
      else
        create_file protofile.full_name, protofile.content
      end
    end
  end
  private
  def _protofiles
    Cloudrider::WebFirm.make_me_a_fucking_website_you_shit(_protosite)
  end
  def _protosite
    Cloudrider::Protosite.from_hash JSON.parse File.read name
  end
end
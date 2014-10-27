module Cloudrider; end
module Cloudrider::Generators; end
class Cloudrider::Generators::ClientGenerator < Rails::Generators::Base
  source_root File.expand_path "../../../../../generica", __FILE__
  desc "Migrates in assets/javascripts files that don't vary from site to site"

  def install_javascripts
    ["apiv1.js.ls", "application.js"].each do |file|
      copy_file "app/assets/javascripts/#{file}", "app/assets/javascripts/#{file}"
    end
    ["adapters", "components", "config", "controllers", "helpers", "mixins", "models", "packages", "routes", "transforms"].each do |folder|
      directory "app/assets/javascripts/#{folder}", "app/assets/javascripts/#{folder}"
    end
    ["application.css", "apiv1.css.scss", "foundation_and_overrides.scss", "apiv1/_admin.css.scss"].each do |file|
      copy_file "app/assets/stylesheets/#{file}", "app/assets/stylesheets/#{file}"
    end
    ["admin", "shared"].each do |folder|
      directory "app/assets/stylesheets/apiv1/#{folder}", "app/assets/stylesheets/apiv1/#{folder}"
    end
    say "Be sure to run bundle and bower install"
  end

end
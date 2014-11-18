module Cloudrider; end
module Cloudrider::Generators; end
class Cloudrider::Generators::ClientGenerator < Rails::Generators::Base
  source_root File.expand_path "../../../../../generica", __FILE__
  desc "Migrates in assets/javascripts and assets/stylesheets files that don't vary from site to site"

  def install_assets
    _copy_config_files
    _copy_support_folders
    _copy_support_styles
    _copy_static_style_folders
    _copy_asset_images
    _copy_static_components
    _copy_static_pages
    _copy_static_component_styles
    _copy_admin_templates
    say "You'll need to separately install varying assets"
    say "varying assets include:"
    say "emblems: "
    say ["application.emblem", "index.emblem"].to_s
    say "components: "
    say ["cookie-splash", "hero-splash", "introductory-lobby", "product-catalog", "product-display", "product-listing", "products-showcase", "site-nav", "table-booths"].to_s
    say "sass: "
    say ["cookie-splash", "hero-splash", "introductory-lobby", "products-catalog", "products-showcase", "site-nav", "table-booths"].to_s
    say "Be sure to run bundle and bower install"
  end

  private
  def _copy_admin_templates
    directory "app/assets/javascripts/templates/admin", "app/assets/javascripts/templates/admin"
  end
  def _copy_asset_images
    directory "app/assets/images", "app/assets/images"
  end
  def _copy_config_files
    ["apiv1.js.ls", "application.js"].each do |file|
      copy_file "app/assets/javascripts/#{file}", "app/assets/javascripts/#{file}"
    end
  end
  def _copy_support_folders
    [
      "adapters", 
      "components", 
      "config", 
      "controllers", 
      "helpers", 
      "mixins", 
      "models", 
      "packages", 
      "routes", 
      "transforms",
      "templates/products",
      "views"
    ].each do |folder|
      directory "app/assets/javascripts/#{folder}", "app/assets/javascripts/#{folder}"
    end
  end
  def _copy_support_styles
    [
      "application.css",
      "apiv1.css.scss",
      "foundation_and_overrides.scss",
      "apiv1/_admin.css.scss",
      "apiv1/modals/_login.css.scss",
      "apiv1/products/product/_show.css.scss"
    ].each do |file|
      copy_file "app/assets/stylesheets/#{file}", "app/assets/stylesheets/#{file}"
    end
  end
  def _copy_static_style_folders
    ["admin", "shared"].each do |folder|
      directory "app/assets/stylesheets/apiv1/#{folder}", "app/assets/stylesheets/apiv1/#{folder}"
    end
  end
  def _copy_static_components
    [
      "tr-span",
      "fancy-paginator",
      "form-for",
      "flash-message",
      "block-grid-pictures",
      "block-picture",
      "flash-slice",
      "promise-button",
      "search-and-filter",
      "select-locale",
      "tree-taxon-li",
      "tree-taxon-ul",
      "preload-billboard",
      "tree-taxon-wrapper"
    ].each do |component|
      copy_file "app/assets/javascripts/templates/components/#{component}.emblem", "app/assets/javascripts/templates/components/#{component}.emblem"
    end
  end
  def _copy_static_pages
    ["modals/login", "products/product/show", "products", "admin"].each do |file|
      copy_file "app/assets/javascripts/templates/#{file}.emblem", "app/assets/javascripts/templates/#{file}.emblem"
    end
  end
  def _copy_static_component_styles
    [
      "block-grid-pictures",
      "fancy-paginator",
      "files-field",
      "flash-message",
      "promise-button",
      "search-and-filter",
      "select-locale",
      "site-footer", 
      "type-ahead",
      "preload-billboard",
      "tree-taxon-wrapper"].each do |file|
      copy_file "app/assets/stylesheets/apiv1/components/_#{file}.css.scss", "app/assets/stylesheets/apiv1/components/_#{file}.css.scss"
    end
  end
end
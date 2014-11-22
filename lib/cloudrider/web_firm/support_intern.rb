class Cloudrider::WebFirm::SupportIntern < Cloudrider::WebFirm::Slave

  def protofiles
    _copy_config_files
    _copy_support_folders
    _copy_support_styles
    _copy_static_style_folders
    _copy_asset_images
    _copy_static_components
    _copy_static_pages
    _copy_static_component_styles
    _copy_admin_templates
  end

  private
  def _copy_file(source, target)
    _push_protofile Cloudrider::Protofile.new(type: :copy_file, source: source, target: target)
  end
  def _directory(source, target)
    _push_protofile Cloudrider::Protofile.new(type: :directory, source: source, target: target)
  end
  def _push_protofile(*protofiles)
    @protofiles ||= []
    @protofiles += protofiles
  end
  def _copy_admin_templates
    _directory "app/assets/javascripts/templates/admin", "app/assets/javascripts/templates/admin"
  end
  def _copy_asset_images
    _directory "app/assets/images", "app/assets/images"
  end
  def _copy_config_files
    ["apiv1.js.ls", "application.js"].each do |file|
      _copy_file "app/assets/javascripts/#{file}", "app/assets/javascripts/#{file}"
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
      "views",
      "templates/modals"
    ].each do |folder|
      _directory "app/assets/javascripts/#{folder}", "app/assets/javascripts/#{folder}"
    end
  end
  def _copy_support_styles
    [
      "application.css",
      "apiv1.css.scss",
      "foundation_and_overrides.scss",
      "apiv1/_admin.css.scss"
    ].each do |file|
      _copy_file "app/assets/stylesheets/#{file}", "app/assets/stylesheets/#{file}"
    end
  end
  def _copy_static_style_folders
    ["admin", "shared", "modals"].each do |folder|
      _directory "app/assets/stylesheets/apiv1/#{folder}", "app/assets/stylesheets/apiv1/#{folder}"
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
      "select-locale",
      "tree-taxon-li",
      "tree-taxon-ul",
      "preload-billboard",
      "tree-taxon-wrapper"
    ].each do |component|
      _copy_file "app/assets/javascripts/templates/components/#{component}.emblem", "app/assets/javascripts/templates/components/#{component}.emblem"
    end
  end
  def _copy_static_pages
    ["admin"].each do |file|
      _copy_file "app/assets/javascripts/templates/#{file}.emblem", "app/assets/javascripts/templates/#{file}.emblem"
    end
  end
  def _copy_static_component_styles
    [
      "block-grid-pictures",
      "fancy-paginator",
      "files-field",
      "flash-message",
      "promise-button",
      "select-locale",
      "type-ahead",
      "preload-billboard",
      "tree-taxon-wrapper"].each do |file|
      _copy_file "app/assets/stylesheets/apiv1/components/_#{file}.css.scss", "app/assets/stylesheets/apiv1/components/_#{file}.css.scss"
    end
  end
end
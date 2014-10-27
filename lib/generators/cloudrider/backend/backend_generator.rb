require 'rails/generators/migration'
module Cloudrider; end
module Cloudrider::Generators; end
class Cloudrider::Generators::BackendGenerator < Rails::Generators::Base
  source_root File.expand_path "../../../../../generica", __FILE__
  include Rails::Generators::Migration
  desc "Migrates in various rubies files"

  def install_rubies
    _migrate_backend
    say "Be sure to run bundle and bower install"
  end
  private
  def _migrate_backend
    copy_file "bower.json", "bower.json"
    copy_file ".bowerrc", ".bowerrc"
    directory "app/models", "app/models"
    directory "app/controllers", "app/controllers"
    directory "app/views", "app/views"
    directory "spec", "spec"
    directory "db/seeds", "db/seeds"
    migration_template "db/migrate/20140930180107_create_apiv1_pictures.rb", "db/migrate/create_apiv1_pictures.rb"
    migration_template "db/migrate/20140930052333_create_apiv1_taxons.rb", "db/migrate/create_apiv1_taxons.rb"
    migration_template "db/migrate/20141021003733_sorcery_core.rb", "db/migrate/sorcery_core.rb"
    migration_template "db/migrate/20140930052559_create_apiv1_listings_plastics.rb", "db/migrate/create_apiv1_listings_plastics.rb"
    migration_template "db/migrate/20140930180108_add_attachment_pic_to_apiv1_pictures.rb", "db/migrate/add_attachment_pic_to_apiv1_pictures.rb"
    migration_template "db/migrate/20141021003734_sorcery_remember_me.rb", "db/migrate/sorcery_remember_me.rb"
    migration_template "db/migrate/20141010215459_create_apiv1_translations.rb", "db/migrate/create_apiv1_translations.rb"
    migration_template "db/migrate/20141006231820_create_apiv1_employees.rb", "db/migrate/create_apiv1_employees.rb"
    migration_template "db/migrate/20141001212635_create_apiv1_listings_taxon_relationships.rb", "db/migrate/create_apiv1_listings_taxon_relationships.rb"
    migration_template "db/migrate/20141001063631_create_commerce_units_dimensions.rb" , "db/migrate/create_commerce_units_dimensions.rb"
    migration_template "db/migrate/20141018235809_add_attachment_document_to_attachments.rb", "db/migrate/add_attachment_document_to_attachments.rb"
    directory "lib/tasks", "lib/tasks"
    directory "lib/generica", "lib/generica"
    copy_file "lib/generica.rb", "lib/generica.rb"
    copy_file "config/desired_languages.yml", "config/desired_languages.yml"
    copy_file ".rspec", ".rspec"
    copy_file "public/tests/dog.png", "public/tests/dog.png"
    copy_file "config/routes.rb", "config/routes.rb"
    copy_file "config/initializers/sorcery.rb", "config/initializers/sorcery.rb"
    append_to_file("Gemfile") { _gemfile_contents }
  end
  def _gemfile_contents
    contents = File.read File.join(self.class.source_root, "Gemfile")
    contents.gsub "source 'https://rubygems.org'\n", ""
  end
end
require 'rails/generators/migration'
module Cloudrider; end
module Cloudrider::Generators; end
class Cloudrider::Generators::BackendGenerator < Rails::Generators::Base
  source_root File.expand_path "../../../../../generica", __FILE__
  include Rails::Generators::Migration
  class << self
    def next_migration_number(dirname)
      next_migration_number = current_migration_number(dirname) + 1
      ActiveRecord::Migration.next_migration_number(next_migration_number)
    end
  end
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
    directory "lib/tasks", "lib/tasks"
    directory "lib/generica", "lib/generica"
    copy_file "lib/generica.rb", "lib/generica.rb"
    copy_file "config/desired_languages.yml", "config/desired_languages.yml"
    copy_file ".rspec", ".rspec"
    copy_file "public/tests/dog.png", "public/tests/dog.png"
    copy_file "config/routes.rb", "config/routes.rb"
    copy_file "config/initializers/sorcery.rb", "config/initializers/sorcery.rb"
    copy_file "config/initializers/i18n_backend.rb", "config/initializers/i18n_backend.rb"
    copy_file "Gemfile", "Gemfile"
  end

end
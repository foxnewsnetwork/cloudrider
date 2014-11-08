require 'rails/generators/migration'
module Cloudrider; end
module Cloudrider::Generators; end
class Cloudrider::Generators::MigrationsGenerator < Rails::Generators::Base
  source_root File.expand_path "../../../../../generica/db/migrate", __FILE__
  include Rails::Generators::Migration
  class << self
    def next_migration_number(dirname)
      next_migration_number = current_migration_number(dirname) + 1
      ActiveRecord::Migration.next_migration_number(next_migration_number)
    end
  end

  desc "Migrations in the database migrations"
  def install_migrations
    _migration_rubies.each do |original_file_and_destination_file|
      migration_template *original_file_and_destination_file
    end
  end
  private

  def _migration_rubies
    _original_filenames.map { |f| [f, _destinationify_filename(f)] }
  end

  def _original_filenames
    Dir[File.join(self.class.source_root, "*.rb")].map { |f| f.split("/").last }
  end

  def _destinationify_filename(f)
    File.join "db", "migrate", f.split("_").tail.join("_")
  end
end
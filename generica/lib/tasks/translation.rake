require Rails.root.join "lib", "generica"
namespace :translation do
  desc "Creates a default seed file using the google translate api"
  task make_seed: :environment do
    Generica::SeedGenerator.new.write_file
  end

  desc "Dumps everything from Apiv1::Translation into writing the config/locales/*.yml files"
  task write_yaml: :environment do
    Generica::YamlWriter.new.write_files
  end
end
require Rails.root.join "lib", "generica"
namespace :cloudrider do
  desc "Creates a default seed file using the google translate api"
  task make_translation_seed: :environment do
    Generica::SeedGenerator.new.write_file
  end
end

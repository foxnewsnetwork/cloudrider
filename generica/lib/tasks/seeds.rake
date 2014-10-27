namespace :seeds do
  desc "loads the translations"
  task translations: :environment do
    require Rails.root.join "db", "seeds", "translation_seeds"
  end
end
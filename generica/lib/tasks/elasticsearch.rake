require 'elasticsearch/rails/tasks/import'

namespace :elasticsearch do

  desc "Imports stuff from translations"
  task simple_import: :environment do
    Apiv1::Translation.import
  end
end
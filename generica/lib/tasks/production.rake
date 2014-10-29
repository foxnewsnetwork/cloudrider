namespace :production do
  desc "These tasks should be run once on a virgin fresh installation"
  task virgin: :environment do

  end

  desc "These tasks should be run everytime you restart the server"
  task on_restart: :environment do
    Rake::Task["assets:clobber"].invoke
    Rake::Task["assets:precompile"].invoke
    Rake::Task["assets:unretardify"].invoke
    Rake::Task["elasticsearch:simple_import"].invoke
  end
end
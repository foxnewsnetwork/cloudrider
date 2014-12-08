class Cloudrider::WebFirm::ScumbagEngineer < Cloudrider::WebFirm::Slave

  def protofiles
    _copy_file "bower.json", "bower.json"
    _copy_file ".bowerrc", ".bowerrc"
    _directory "app/models", "app/models"
    _directory "app/controllers", "app/controllers"
    _directory "app/views", "app/views"
    _directory "spec", "spec"
    _directory "db/seeds", "db/seeds"    
    _directory "lib/tasks", "lib/tasks"
    _directory "lib/generica", "lib/generica"
    _copy_file "lib/generica.rb", "lib/generica.rb"
    _copy_file "config/desired_languages.yml", "config/desired_languages.yml"
    _copy_file ".rspec", ".rspec"
    _directory "public/tests", "public/tests"
    _copy_file "config/routes.rb", "config/routes.rb"
    _copy_file "config/initializers/sorcery.rb", "config/initializers/sorcery.rb"
    _copy_file "config/initializers/i18n_backend.rb", "config/initializers/i18n_backend.rb"
    _copy_file "Gemfile", "Gemfile"
    _copy_file ".gitignore", ".gitignore"
    _directory "test", "test"
    _push_protofile *_backend_commander.files_to_write
  end

  private
  def _backend_commander
    @backend_commander ||= Cloudrider::BackendCommander.new name: "configs", protosite: @protosite
  end
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
end
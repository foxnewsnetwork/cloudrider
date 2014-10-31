require "cloudrider/application_commander"

module Cloudrider::Generators; end
class Cloudrider::Generators::FrontendGenerator < Rails::Generators::NamedBase
  desc "Write frontend templates/*.emblem and templates/components/*.emblem"
  
  def create_the_variable_files
    Cloudrider::ApplicationCommander.new.files_to_write.each do |protofile|
      create_file protofile.full_name, protofile.content
    end
  end  
end
require "tilt"
require "erb"
require 'active_support'
require "active_support/core_ext"
require "functional_support"
module Cloudrider::Apiv1
  require File.join(__dir__, "apiv1", "base.rb")
  Dir[File.join(__dir__, "apiv1", "*.rb")].each { |f| require f }
  class << self
    def source_root
      File.expand_path "../../../generica", __FILE__
    end
    def file_name_from_class_name(class_name)
      family = family_from_class_name(class_name.to_s)
      case family
      when :component
        _file_name_process.call(class_name.to_s).join("-")
      when :sass
        "_" + _file_name_process.call(class_name.to_s).join("-")
      when :emblem, :ember
        _file_name_process.call(class_name.to_s).join("_")
      else
        raise Base::UnknownFamilyResidence, family
      end
    end
    def file_ext_from_class_name(class_name)
      _file_ext_process.call class_name.to_s
    end
    def family_from_class_name(class_name)
      _file_family_process.call class_name.to_s
    end
    private
    def _file_family_process
      _last_member_of_scope_operator >> _underscorify >> _keep_only_family
    end
    def _file_name_process
      _last_member_of_scope_operator >> _underscorify >> _strip_out_family
    end
    def _file_ext_process
       _file_family_process >> _assign_extension_based_on_family
    end
    def _assign_extension_based_on_family
      lambda do |family|
        case family
        when :component, :emblem
          ".emblem"
        when :sass
          ".css.scss"
        when :ember
          ".js.em"
        when :coffee
          ".js.coffee"
        when :live
          ".js.ls"
        else
          raise Base::UnknownFileExtension, family
        end
      end
    end
    def _keep_only_family
      -> (s) { s.split("_").last.to_sym }
    end
    def _last_member_of_scope_operator
      -> (s) { s.split("::").last }
    end
    def _underscorify
      -> (s) { s.underscore }
    end
    def _strip_out_family
      -> (s) { s.split("_").head }
    end
  end
end

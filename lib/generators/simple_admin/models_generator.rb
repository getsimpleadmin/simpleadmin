require 'rails/generators/base'
require 'rails/generators/active_record'

module SimpleAdmin
  module Generators
    class ModelsGenerator < ActiveRecord::Generators::Base
      argument :name, default: 'simple_admin'
      source_root File.expand_path('../../templates', __FILE__)

      def copy_locale
        copy_file '../templates/models/user.rb.erb', 'app/models/simple_admin/user.rb'
      end
    end
  end
end

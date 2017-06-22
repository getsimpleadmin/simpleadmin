module SimpleAdmin
  module Generators
    class AssetsGenerator < Rails::Generators::Base

      source_root File.expand_path("../../templates", __FILE__)

      def install_assets
        template 'assets/simple_admin.js', 'app/assets/javascripts/simple_admin.js'
        template "assets/simple_admin.css", "app/assets/stylesheets/simple_admin.css"
      end

    end
  end
end

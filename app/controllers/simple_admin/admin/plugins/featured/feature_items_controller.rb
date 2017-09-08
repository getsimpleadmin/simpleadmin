module SimpleAdmin
  module Admin
    module Plugins
      module Featured
        class FeatureItemsController < BaseController
          def autocomplete
            posts =
              SimpleAdmin::Post.with_translations(:en).where('title LIKE ?', "%#{params[:title]}%").map do |post|
                { id: post.id, title: post.title }
              end

            render json: posts
          end
        end
      end
    end
  end
end

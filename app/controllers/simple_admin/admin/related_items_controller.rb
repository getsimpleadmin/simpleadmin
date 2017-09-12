module SimpleAdmin
  module Admin
    class RelatedItemsController < BaseController
      def create
        @related_item = SimpleAdmin::RelatedItem.new(resource_params)
        @related_item.save

        @resource = @related_item.object

        respond_to do |format|
          format.js { render layout: false }
        end
      end

      def update
        @related_item = SimpleAdmin::RelatedItem.find(params[:id])
        @related_item.update(resource_params)

        respond_to do |format|
          format.js { render layout: false }
        end
      end

      def destroy
        @related_item = SimpleAdmin::RelatedItem.find(params[:id])
        @related_item.destroy

        respond_to do |format|
          format.js { render layout: false }
        end
      end

      private

        def resource_params
          params.require(:simple_admin_related_item).permit(:object_type, :object_id, :related_object_type, :related_object_id)
        end
    end
  end
end

# frozen_string_literal: true

module Admin::Resources
  class BatchDestroyController < Admin::ApplicationController
    def destroy
      resource_ids = params[:resource_ids].split(',')

      resource_ids.each do |resource_id|
        @project_connector.send_request(:destroy_resource, {}, resource_id)
      end

      redirect_to admin_resources_path, notice: t('simple_admin.resource.destroy.success',
                                                  resource_name: params[:resource_id].capitalize)
    end
  end
end

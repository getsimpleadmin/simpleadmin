# frozen_string_literal: true

module Admin::Account::Settings
  class ClearRedisCacheController < Admin::ApplicationController
    def create
      Redis.current.del("#{@project.url}/#{API::Endpoints::V1::Tables::ENDPOINT_URL}")

      @project.entities.pluck(:model_klass_name).each do |model_klass_name|
        Redis.current.del("#{@project.url}/#{API::Endpoints::V1::Table::ENDPOINT_URL}/#{model_klass_name}")
      end

      redirect_to admin_account_settings_path, notice: 'Database structure cache deleted!'
    end
  end
end

module SimpleAdmin
  module V1
    module Widgets
      class WeekStatisticController < SimpleAdmin::V1::BaseController
        def show
          model_klass   = SimpleAdmin::Abstractions::Model.find_by_name(params[:model_klass_name])
          days, dataset = *SimpleAdmin::Abstractions::Widget.week_statistic(model_klass)

          render json: {
            dataset: dataset,
            days:    days
          }
        end
      end
    end
  end
end

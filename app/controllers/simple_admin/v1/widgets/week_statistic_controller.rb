module SimpleAdmin
  module V1
    module Widgets
      class WeekStatisticController < SimpleAdmin::V1::BaseController
        WEEK_RANGE = (0..6)

        def show
          model_klass = SimpleAdmin::Abstractions::Model.find_by_name(params[:model_klass_name])

          dataset = WEEK_RANGE.collect { |i| model_klass.where(created_at: i.days.from_now.midnight..i.days.from_now.end_of_day).count }.reverse
          days    = WEEK_RANGE.collect { |i| i.days.from_now.strftime('%A') }.reverse

          render json: {
            dataset: dataset,
            days:    days
          }
        end
      end
    end
  end
end

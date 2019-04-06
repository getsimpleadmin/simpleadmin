module SimpleAdmin
  module Abstractions
    module Widget
      def week_statistic(model_klass, range=(0..6))
        dataset = range.map { |time| model_klass.where(created_at: time.days.from_now.midnight..time.days.from_now.end_of_day).count }
        days    = range.map { |time| time.days.from_now.strftime('%A') }

        [
          dataset,
          days
        ].reverse
      end

      module_function :week_statistic
    end
  end
end

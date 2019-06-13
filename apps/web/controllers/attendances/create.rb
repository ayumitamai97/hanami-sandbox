module Web
  module Controllers
    module Attendances
      class Create
        include Web::Action

        def call(params)
          AttendanceRepository.new.record_time(
            user_id: params.get(:attendance, :user_id),
            timestamp: params.get(:attendance, :timestamp).nil? ? nil : Time.parse(params.get(:attendance, :timestamp))
          )

          redirect_to '/attendances'
        end
      end
    end
  end
end

module Web
  module Controllers
    module Attendances
      class Create
        include Web::Action

        def call(params)
          repository = AttendanceRepository.new
          repository.stamp_attendance(user_id: params.get(:attendance, :user_id))

          redirect_to '/attendances'
        end
      end
    end
  end
end

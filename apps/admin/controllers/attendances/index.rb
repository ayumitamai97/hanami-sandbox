module Admin
  module Controllers
    module Attendances
      class Index
        include Admin::Action
        expose :attendances

        def call(params)
          repository = AttendanceRepository.new
          @attendances = repository.not_approved_attendances
        end
      end
    end
  end
end

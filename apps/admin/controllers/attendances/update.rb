module Admin
  module Controllers
    module Attendances
      class Update
        include Admin::Action

        def call(params)
          repository = AttendanceRepository.new
          attendance = repository.find(params.get(:id))
          repository.approve(id: attendance.id)

          redirect_to '/admin/attendances'
        end
      end
    end
  end
end

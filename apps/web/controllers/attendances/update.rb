module Web
  module Controllers
    module Attendances
      class Update
        include Web::Action

        def call(params)
          repository = AttendanceRepository.new
          attendance = repository.find(params.get(:attendance, :id))
          repository.update(
            attendance.id,
            started_at: params.get(:attendance, :started_at),
            ended_at: params.get(:attendance, :ended_at)
          )

          redirect_to '/attendances'
        end
      end
    end
  end
end

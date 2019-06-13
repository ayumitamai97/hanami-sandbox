module Web
  module Controllers
    module Attendances
      class Edit
        include Web::Action
        expose :attendance

        def call(params)
          repository = AttendanceRepository.new
          @attendance = repository.find(params.get(:id))
        end
      end
    end
  end
end

module Web
  module Controllers
    module Attendances
      class Index
        include Web::Action
        expose :attendances

        def call(params)
          repository = AttendanceRepository.new
          # TODO login
          @attendances = repository.users_attendances(user_id: 1)
        end
      end
    end
  end
end

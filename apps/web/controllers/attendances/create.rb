module Web
  module Controllers
    module Attendances
      class Create
        include Web::Action

        def call(params)
          repository = AttendanceRepository.new

          # NOTE: 本当は「打刻する」というメソッドを呼ぶだけで、そのメソッド内で分岐するのが綺麗そう
          if left?(repository.last)
            repository.attend(
              user_id: params.get(:attendance, :user_id),
              started_at: params.get(:attendance, :started_at).nil? ? nil : Time.parse(params.get(:attendance, :started_at))
            )
          else
            repository.leave(
              id: repository.last.id,
              ended_at: params.get(:attendance, :ended_at).nil? ? nil : Time.parse(params.get(:attendance, :ended_at))
            )
          end

          redirect_to '/attendances'
        end

        private

        def left?(last_attendance)
          !last_attendance.ended_at.nil?
        end
      end
    end
  end
end

module Admin
  module Views
    module Attendances
      class Index
        include Admin::View

        def not_approved_attendances_list
          html.div do
            attendances.each do |attendance|
              div do
                p "User: #{UserRepository.new.find_by_attendance(attendance_id: attendance.id).email}"
                p "Started at: #{attendance.started_at}"
                p "Ended at: #{attendance.ended_at}"
                # ↓このdivブロックがないといけない謎
                div do
                  form_for :attendance, routes.attendance_path(attendance.id), method: :patch do
                    submit 'Approve attendance'
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

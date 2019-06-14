module Web
  module Views
    module Attendances
      class Edit
        include Web::View

        def attendance_update_request_form
          html.div do
            form_for :attendance, routes.attendance_path(attendance.id), method: :patch do
              hidden_field :id, value: attendance.id
              hidden_field :user_id, value: 1
              datetime_field :started_at, value: attendance.started_at.strftime('%Y/%m/%d %H:%m')
              datetime_field :ended_at, value: attendance.ended_at.strftime('%Y/%m/%d %H:%m')
              submit 'Request Attendance Stamp'
            end
          end
        end
      end
    end
  end
end

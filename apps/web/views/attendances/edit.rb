module Web
  module Views
    module Attendances
      class Edit
        include Web::View

        def attendance_update_request_form
          html.div(class: 'row mt-5 mb-5') do
            form_for :attendance, routes.attendance_path(attendance.id), method: :patch, class: 'col-md-6 form-group' do
              hidden_field :id, value: attendance.id
              hidden_field :user_id, value: 1
              datetime_field :started_at, value: attendance.started_at&.strftime('%Y/%m/%d %H:%m'), class: 'form-control mb-2'
              datetime_field :ended_at, value: attendance.ended_at&.strftime('%Y/%m/%d %H:%m'), class: 'form-control mb-2'
              submit 'Request Attendance Stamp', class: 'btn btn-primary'
            end
          end
        end
      end
    end
  end
end

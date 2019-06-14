module Web
  module Views
    module Attendances
      class New
        include Web::View

        def stamp_form
          html.div(class: 'row mt-5 mb-5') do
            form_for :attendance, routes.attendances_path, class: 'col-md-6 form-group' do
              hidden_field :user_id, value: 1
              submit 'Stamp Attendance Now', class: 'btn btn-primary'
            end
          end
        end

        def request_stamp_form
          html.div(class: 'row mt-5 mb-5') do
            form_for :attendance, routes.attendances_path, class: 'col-md-6 form-group' do
              hidden_field :user_id, value: 1
              datetime_field :timestamp, class: 'form-control mb-2'
              submit 'Request Attendance', class: 'btn btn-secondary'
            end
          end
        end
      end
    end
  end
end

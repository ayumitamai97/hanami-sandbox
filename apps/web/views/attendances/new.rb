module Web
  module Views
    module Attendances
      class New
        include Web::View

        def stamp_form
          html.div do
            form_for :attendance, routes.attendances_path do
              hidden_field :user_id, value: 1
              submit 'Stamp Attendance Now'
            end
          end
        end

        def request_stamp_form
          html.div do
            form_for :attendance, routes.attendances_path do
              hidden_field :user_id, value: 1
              datetime_field :timestamp
              submit 'Request Attendance'
            end
          end
        end
      end
    end
  end
end

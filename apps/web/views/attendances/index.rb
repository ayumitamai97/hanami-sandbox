module Web
  module Views
    module Attendances
      class Index
        include Web::View

        def attendances_list
          html.div do
            attendances.each do |attendance|
              div(class: 'card mb-3') do
                div(class: 'card-body') do
                  p "Start at: #{attendance.started_at}"
                  p "End at: #{attendance.ended_at}"
                  div do
                    span attendance.approved? ? 'Approved' : 'Not approved yet'
                    span link_to 'Edit', routes.edit_attendance_path(attendance.id), class: 'btn btn-primary ml-2'
                  end
                end
              end
            end
          end
        end

        def flash_success(msg)
          if msg
            html.div(class: 'alert alert-success mb-3') do
              flash[:success]
            end
          end
        end
      end
    end
  end
end

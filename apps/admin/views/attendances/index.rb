module Admin
  module Views
    module Attendances
      class Index
        include Admin::View

        def not_approved_attendances_list
          html.div do
            attendances.each do |attendance|
              div(class: 'card mb-3') do
                div(class: 'card-body') do
                  p "User: #{UserRepository.new.find_by_attendance(attendance_id: attendance.id).email}"
                  p "Started at: #{attendance.started_at}"
                  p "Ended at: #{attendance.ended_at}"
                  div do
                    form_for :attendance, routes.attendance_path(attendance.id), method: :patch, class: 'form-group' do
                      submit 'Approve attendance', class: 'btn btn-primary'
                    end
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

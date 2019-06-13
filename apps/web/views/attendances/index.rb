module Web
  module Views
    module Attendances
      class Index
        include Web::View

        def attendances_list
          html.div do
            attendances.each do |attendance|
              div do
                p "Start at: #{attendance.started_at}"
                p "End at: #{attendance.ended_at}"
              end
            end
          end
        end
      end
    end
  end
end
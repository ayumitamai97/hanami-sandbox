module Admin
  module Views
    module Users
      class Index
        include Admin::View

        def title
          html.div do
            h1 'Users'
          end
        end

        def users_list
          html.div do
            users.each do |user|
              div do
                p "Email: #{user.email}"
                p "Role: #{user.role}"
              end
            end
          end
        end
      end
    end
  end
end

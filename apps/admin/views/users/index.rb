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
                p "Role: #{role(user: user)}"
              end
            end
          end
        end

        private

        def role(user:)
          # FIXME N+1 problem どうすればいいんだ……
          repository.role(id: user.id)
        end
      end
    end
  end
end

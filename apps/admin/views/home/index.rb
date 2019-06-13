module Admin
  module Views
    module Home
      class Index
        include Admin::View

        def title
          html.div do
            h1 'Admin Kintai Home'
          end
        end
      end
    end
  end
end

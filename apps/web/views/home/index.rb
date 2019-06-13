module Web
  module Views
    module Home
      class Index
        include Web::View

        def title
          html.div do
            h1 'Kintai Home'
          end
        end
      end
    end
  end
end

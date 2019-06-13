module Web
  module Controllers
    module Users
      class Index
        include Web::Action
        expose :users, :repository

        def call(params)
          @repository = UserRepository.new # FIXME: この行ここでいいのか？
          @users = repository.all
        end
      end
    end
  end
end

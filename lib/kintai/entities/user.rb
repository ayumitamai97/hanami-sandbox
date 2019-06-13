class User < Hanami::Entity
  EMAIL_FORMAT = /\@/
  # ↓ repositoryに書くのがいいのか？わからない…
  NORMAL_USER_ROLE = 0
  ADMIN_USER_ROLE = 1

  attributes do
    attribute :id, Types::Int
    attribute :email, Types::String.constrained(format: EMAIL_FORMAT)
    attribute :user_role, Types::Int
    attribute :created_at, Types::Time
    attribute :updated_at, Types::Time

    attribute :attendances, Types::Strict::Array
  end

  def role
    case user_role
    when NORMAL_USER_ROLE
      :normal_user
    when ADMIN_USER_ROLE
      :admin_user
    else
      nil
    end
  end
end

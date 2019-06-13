class User < Hanami::Entity
  EMAIL_FORMAT = /\@/

  attributes do
    attribute :id, Types::Int
    attribute :email, Types::String.constrained(format: EMAIL_FORMAT)
    attribute :user_role, Types::Int
    attribute :created_at, Types::Time
    attribute :updated_at, Types::Time

    attribute :attendances, Types::Strict::Array
  end
end

class UserRepository < Hanami::Repository
  associations do
    has_many :attendances
  end

  NORMAL_USER_ROLE = 0
  ADMIN_USER_ROLE = 1

  def normal_users
    users.where(user_role: NORMAL_USER_ROLE)
  end

  def admin_users
    users.where(user_role: ADMIN_USER_ROLE)
  end

  def find_with_attendances(user:)
    aggregate(:attendances).where(id: user.id).map_to(User).one
  end
end

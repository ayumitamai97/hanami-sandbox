class UserRepository < Hanami::Repository
  associations do
    has_many :attendances
  end

  def normal_users
    users.where(user_role: NORMAL_USER_ROLE)
  end

  def admin_users
    users.where(user_role: ADMIN_USER_ROLE)
  end

  def find_with_attendances(user_id:)
    aggregate(:attendances).where(id: user_id).map_to(User).one
  end

  def find_by_attendance(attendance_id:)
    find(AttendanceRepository.new.find(attendance_id).user_id)
  end
end

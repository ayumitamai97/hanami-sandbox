class AttendanceRepository < Hanami::Repository
  def stamp_attendance(user_id:)
    create(user_id: user_id, started_at: Time.now, approved_at: Time.now)
  end

  def stamp_leave(user_id:, attendance_id:)
    # TODO
  end

  def request_attendance(user_id:)
    create(user_id: user_id, started_at: Time.now)
  end

  def request_leave(user_id:, attendance_id:)
    # TODO
  end

  def approved_attendances
    attendances.where('approved_at IS NOT NULL')
  end

  def users_attendances(user_id:)
    attendances.where(user_id: user_id)
  end
end

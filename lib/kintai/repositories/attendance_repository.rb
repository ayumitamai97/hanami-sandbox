class AttendanceRepository < Hanami::Repository
  def stamp_attendance(user:)
    create(user_id: user.id, started_at: Time.now, approved_at: Time.now)
  end

  def stamp_leave(user:, attendance:)
    # TODO
  end

  def request_attendance(user:)
    create(user_id: user.id, started_at: Time.now)
  end

  def request_leave(user:, attendance:)
    # TODO
  end

  def approved_attendances
    attendances.where('approved_at IS NOT NULL')
  end
end

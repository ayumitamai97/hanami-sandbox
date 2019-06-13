class AttendanceRepository < Hanami::Repository
  def attend(user_id: nil, started_at: nil)
    if started_at.nil?
      stamp_attendance(user_id: user_id)
    else
      request_attendance(user_id: user_id, started_at: started_at)
    end
  end

  def leave(id:, ended_at: nil)
    if ended_at.nil?
      stamp_leave(id: id)
    else
      request_leave(id: id, ended_at: ended_at)
    end
  end

  def approved_attendances
    attendances.where('approved_at IS NOT NULL')
  end

  def users_attendances(user_id:)
    attendances.where(user_id: user_id)
  end

  private

  def stamp_attendance(user_id:)
    create(user_id: user_id, started_at: Time.now, approved_at: Time.now)
  end

  def stamp_leave(id:)
    update(id, ended_at: Time.now)
  end

  def request_attendance(user_id:, started_at:)
    create(user_id: user_id, started_at: started_at)
  end

  def request_leave(id:, ended_at:)
    update(id, ended_at: ended_at)
  end
end

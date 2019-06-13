class Attendance < Hanami::Entity
  def approved?
    !approved_at.nil?
  end
end

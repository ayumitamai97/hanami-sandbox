RSpec.describe Attendance, type: :entity do
  it 'can be initialized with attributes' do
    time = Time.now
    attendance = Attendance.new(user_id: 1, started_at: time)
    expect(attendance.user_id).to eq 1
    expect(attendance.started_at).to eq(time)
  end
end

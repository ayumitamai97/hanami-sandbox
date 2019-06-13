RSpec.describe AttendanceRepository, type: :repository do
  let(:repository) { AttendanceRepository.new }
  let(:user) do
    UserRepository.new.first || UserRepository.new.create(email: "test#{SecureRandom.uuid}@example.com", user_role: 0)
  end

  it 'can stamp attendance with valid attributes' do
    expect { repository.stamp_attendance(user: user) }.to change { repository.all.count }.by(1)
  end
end

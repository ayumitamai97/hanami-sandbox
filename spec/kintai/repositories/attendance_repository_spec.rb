RSpec.describe AttendanceRepository, type: :repository do
  let(:repository) { AttendanceRepository.new }
  let (:user) { UserRepository.new.first || UserRepository.new.create(email: "test#{SecureRandom.uuid}@example.com", user_role: 0) }

  it 'can stamp attendance with valid attributes' do
    # TODO: FactoryBot?
    expect { repository.stamp_attendance(user_id: user.id) }.to change { repository.all.count }.by(1)
  end

  it 'user has_many attendance stamps' do
    expect { repository.stamp_attendance(user_id: user.id) }
      .to change { UserRepository.new.find_with_attendances(user: user).attendances.count }.by(1)
  end
end

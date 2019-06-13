RSpec.describe UserRepository, type: :repository do
  let(:repository) { UserRepository.new }
  it 'can create user with valid attributes' do
    expect { repository.create(email: "test#{SecureRandom.uuid}@example.com", user_role: 0) }
      .to change { repository.all.count }.by(1)
  end
end

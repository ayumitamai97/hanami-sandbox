RSpec.describe User, type: :entity do
  it 'can be initialized with attributes' do
    email = 'user@example.com'
    user = User.new(email: email, user_role: 0)
    expect(user.email).to eq(email)
    expect(user.user_role).to eq(0)
  end
end















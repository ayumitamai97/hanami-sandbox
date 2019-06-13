require 'features_helper'

RSpec.describe 'Visit Home' do
  it 'renders correct h1' do
    visit '/'
    expect(page).to have_content('Kintai Home')
  end
end

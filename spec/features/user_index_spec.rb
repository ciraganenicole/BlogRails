require 'rails_helper'

RSpec.feature 'UserIndices', type: :feature do
  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: 'jane@gmail.com'
    fill_in 'Password', with: '232323'
    click_button 'Log in'
  end

  it 'list all usernames ' do
    visit users_path
    expect(page.html).to have_content('Jane')
  end

  it 'The page should include All users' do
    expect(page.html).to include('All users')
  end

  it 'View a specific user post' do
    user = User.all.first
    expect(page).to have_content("Number of posts:#{user.postsCounter || 0}")
  end

  it 'Should show aspecific user when a user card is clicked' do
    user = User.all.first
    first(:link, user.name).click
    expect(page.current_path).to eql(user_path(id: user.id))
  end
end

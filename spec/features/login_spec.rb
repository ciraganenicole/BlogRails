require 'rails_helper'

RSpec.feature "Logins", type: :feature do
  before(:each) do
    visit root_path
    click_link 'Login'
    visit new_user_session_path
  end

  it 'has inputs and a submit button' do
    expect(page.html).to include('Email')
    expect(page.html).to include('Password')
    expect(page.html).to have_button('Log in')
  end

  it 'returns error when inputs are empty' do
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password')
  end

  it 'returns error when submit wrong input data' do
    fill_in 'Email', with: 'uuiiihgygy@gmail.com'
    fill_in 'Password', with: 'yyyuuu56677'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password')
  end

  it 'should redirect to root page when enters correct data' do
    fill_in 'Email', with: 'jane@gmail.com'
    fill_in 'Password', with: '232323'
    click_button 'Log in'
    expect(page.current_path).to eql(root_path)
  end
end

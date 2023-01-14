require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  before :each do
    User.create!(name: 'Testing', email: 'user@example.com', password: 'password')
  end

  it 'can see the user[email] and user[password]' do
    visit user_session_path
    expect(page).to have_field 'user[email]'
    expect(page).to have_field 'user[password]'
  end

  it 'click the login button with wrong inputs ' do
    visit user_session_path
    within('form') do
      fill_in 'user[email]', with: 'wronguser@incorrect'
      fill_in 'user[password]', with: 'wrongpassowrd'
    end
    click_button 'Log in'
    expect(current_path).to eq new_user_session_path
  end

  it 'Login successfully' do
    visit user_session_path
    within('form') do
      fill_in 'user[email]', with: 'user@example.com'
      fill_in 'user[password]', with: 'password'
    end
    click_button 'Log in'
    expect(current_path).to eq root_path
  end
end

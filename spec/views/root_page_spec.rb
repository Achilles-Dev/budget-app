require 'rails_helper'

RSpec.describe 'Homepage', type: :feature do
  before :each do
    visit root_path
  end

  it 'can see the app name button' do
    expect(page).to have_content 'Money Manager'
  end

  it 'can see the LOG IN button' do
    expect(page).to have_content 'LOG IN'
  end

  it 'can see the SIGN UP button' do
    expect(page).to have_content 'SIGN UP'
  end

  it 'click the login button with wrong inputs ' do
    click_link 'LOG IN'
    expect(current_path).to eq new_user_session_path
  end

  it 'click the login button with wrong inputs ' do
    click_link 'SIGN UP'
    expect(current_path).to eq new_user_registration_path
  end
end

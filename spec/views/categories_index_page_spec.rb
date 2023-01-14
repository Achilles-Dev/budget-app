require 'rails_helper'

RSpec.describe 'CategoriesIndexPage', type: :feature do
  before(:each) do
    @user = User.new(name: 'Testing', email: 'user@example.com', password: 'password')
    @user.save
    visit user_session_path
    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'
    @category = Category.new(name: 'Food', icon: 'https://www.freeiconspng.com/uploads/city-hospital-icon-5.png',
                             author: @user)
    @category.save
    visit categories_path
  end

  it 'shows page title' do
    expect(page).to have_content 'Categories'
  end

  it 'shows category name' do
    expect(page).to have_content @category.name
  end

  it 'shows button to add new category' do
    expect(page).to have_content 'Add a new Category'
  end

  it "click on category name to redirect to category deals' page" do
    click_link 'Food'
    expect(current_path).to eq category_deals_path(@category)
  end

  it 'click on button to add new category redirect to new category path' do
    click_link 'Add a new Category'
    expect(current_path).to eq new_category_path
  end
end

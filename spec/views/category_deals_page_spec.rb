require 'rails_helper'

RSpec.describe 'CategoryDealsPage', type: :feature do
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
    @deal = Deal.new(name: 'Bread', amount: 10.0, author: @user)
    @deal.save
    @cat_deal = CategoryDeal.new(category: @category, deal: @deal)
    @cat_deal.save
    visit category_deals_path(@category)
  end

  it 'shows page title' do
    expect(page).to have_content @category.name
  end

  it 'shows deal name' do
    expect(page).to have_content @deal.name
  end

  it 'shows total amount of deals for the category' do
    expect(@category.total_amount).to eq @deal.amount
  end

  it 'click on button to add new deal redirect to new category path' do
    click_link 'Add a new deal'
    expect(current_path).to eq new_category_deal_path(@category)
  end
end

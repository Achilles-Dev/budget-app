require 'rails_helper'

RSpec.describe CategoryDeal, type: :model do
  @user1 = User.new(name: 'CategoryDeal', email: 'categorydeal@user.com', password: '123456')
  category = Category.create!(name: 'CategoryDealFood', icon: 'https://www.freeiconspng.com/uploads/city-hospital-icon-5.png',
                              author: @user1)
  deal = Deal.create!(name: 'CategoryDealBread', amount: 10.0, author: @user1)

  subject = CategoryDeal.new(category:, deal:)

  subject.save

  it 'category_id must not be blank' do
    subject.category_id = nil
    expect(subject).to_not be_valid
  end

  it 'deal_id must not be blank' do
    subject.deal_id = nil
    expect(subject).to_not be_valid
  end
end

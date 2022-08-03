require 'rails_helper'

RSpec.describe Category, type: :model do
  user = User.new(name: 'Solo', email: 'categoryuser@user.com', password: '123456')
  subject do
    Category.new(name: 'Food', icon: 'https://www.freeiconspng.com/uploads/city-hospital-icon-5.png', author: user)
  end

  before { subject.save }

  it 'name must not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon must not be blank' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  describe '#total amount' do
    it 'should return value' do
      deal1 = Deal.create!(name: 'Bread', amount: 10.0, author: user)
      deal2 = Deal.create!(name: 'Bread', amount: 23.0, author: user)
      subject.deals.push(deal1)
      subject.deals.push(deal2)
      expected_value = 33.0
      expect(subject.total_amount).to eql(expected_value)
    end
  end
end

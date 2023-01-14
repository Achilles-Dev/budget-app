require 'rails_helper'

RSpec.describe Category, type: :model do
  @user = User.create!(name: 'CategorySolo', email: 'categoryuser@user1.com', password: '123456')
  subject = Category.new(name: 'Food', icon: 'https://www.freeiconspng.com/uploads/city-hospital-icon-5.png',
                         author: @user)
  subject.save

  it 'name must not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon must not be blank' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end

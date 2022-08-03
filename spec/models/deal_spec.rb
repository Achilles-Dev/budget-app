require 'rails_helper'

RSpec.describe Deal, type: :model do
  user = User.new(name: 'Solo', email: 'dealuser@user.com', password: '123456')
  subject do
    Deal.new(name: 'Bread', amount: 10.0, author: user)
  end

  before { subject.save }

  it 'name must not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount must not be blank' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'amount must be an integer' do
    subject.amount = 'two'
    expect(subject).to_not be_valid
  end

  it 'amount must be greater than zero' do
    subject.amount = -2
    expect(subject).to_not be_valid
  end

  it 'amount must be less than a billion' do
    subject.amount = 1_000_000_000
    expect(subject).to_not be_valid
  end
end

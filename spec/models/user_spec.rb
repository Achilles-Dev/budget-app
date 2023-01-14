require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Solo', email: 'user@user.com', password: '123456') }

  before { subject.save }

  it 'name must not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'password must be at least 6 characters' do
    subject.password = '1234'
    expect(subject).to_not be_valid
  end
end

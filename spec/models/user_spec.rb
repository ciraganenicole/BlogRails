require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'gloire', email: 'gloire@gmail.com', password: '123456', password_confirmation: '123456') }

  before { subject.save }

  it 'should save the data' do
    expect(subject).to be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should not use an existing email' do
    subject.email = User.first.email
    expect(subject).to_not be_valid
  end
end

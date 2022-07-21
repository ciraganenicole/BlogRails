require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    Comment.new(user_id: User.first.id, post_id: Post.first.id, text: 'Good improvements')
  end

  before { subject.save }

  it 'should save the data' do
    expect(subject).to be_valid
  end

  it 'user_id should be present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'post_id should be present' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'post_id should be a string' do
    subject.post_id = '11123'
    expect(subject).to_not be_valid
  end

  it 'user_id should be a string' do
    subject.user_id = '1123'
    expect(subject).to_not be_valid
  end
end

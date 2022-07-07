require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                       postsCounter: 0)
    post = Post.create(title: 'Hello', text: 'This is my first post', commentsCounter: 0, likesCounter: 0,
                       user_id: user.id)
    Comment.new(user_id: user.id, post_id: post.id, text: 'Good improvements')
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
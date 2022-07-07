require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                       postsCounter: 0)
    Post.new(title: 'Hello', text: 'This is my first post', commentsCounter: 0, likesCounter: 0, user_id: user.id)
  end

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
end

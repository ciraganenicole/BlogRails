require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(title: 'Hello', text: 'This is my first post', commentsCounter: 0, likesCounter: 0, user_id: User.first.id)
  end

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
end

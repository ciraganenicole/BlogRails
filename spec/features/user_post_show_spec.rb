require 'rails_helper'
RSpec.feature "UserPostShows", type: :feature do
  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: 'jane@gmail.com'
    fill_in 'Password', with: '232323'
    click_button 'Log in'
    user = User.all.first
    first(:link, user.name).click
    click_link('See all posts')
    post = Post.all.first
    first(:link, post.text).click
  end
  it 'can see the post\'s title' do
    user = User.all.first
    expect(page).to have_content(user.posts.first.text)
  end
  it 'can see who wrote the post' do
    user = User.all.first
    expect(page).to have_content(user.name)
  end
  it 'can see how many comments the post has' do
    post = Post.all.first
    expect(page).to have_content("Comments #{post.commentsCounter}")
  end
  it 'can see how many likes a post have' do
    post = Post.all.first
    expect(page).to have_content("Likes:#{post.likesCounter}")
  end
  it 'can see the post body' do
    post = Post.all.first
    expect(page).to have_content(post.text)
  end
  it 'See the username of each commentor' do
    post = Post.all.first
    post.comments.includes(:user).each do |comment|
      expect(page).to have_content(comment.user.name)
    end
  end
  it 'See the comment of each commentor' do
    post = Post.all.first
    post.comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end
end

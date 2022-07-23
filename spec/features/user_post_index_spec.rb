require 'rails_helper'

RSpec.feature "UserPostIndices", type: :feature do
  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: 'jane@gmail.com'
    fill_in 'Password', with: '232323'
    click_button 'Log in'
    user = User.all.first
    click_link(user.name)
    click_link('See all posts')
  end

  it 'The page should include Create new post' do
    expect(page.html).to include('Create new post')
  end

  it 'The page should include the user\'s name' do
    user = User.all.first
    expect(page.html).to have_content(user.name)
  end

  it 'can see the user\'s number of posts' do
    user = User.all.first
    expect(page).to have_content("Number of posts:#{user.postsCounter}")
  end

  it 'can see the post title' do
    user = User.all.first
    expect(page).to have_content(user.posts.first.text)
  end

  it 'can see the post body' do
    post = Post.all.first
    expect(page).to have_content(post.text)
  end

  it 'can see how many likes a post have' do
    post = Post.all.first
    expect(page).to have_content("Likes:#{post.likesCounter}")
  end

  it 'redirects to the post\'s page when a post is clicked' do
    user = User.all.first
    post = Post.all.first
    first(:link, post.text).click
    expect(page.current_path).to eql(user_post_path(user_id: user.id, id: post.id))
  end
end

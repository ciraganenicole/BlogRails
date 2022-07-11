require 'rails_helper'

RSpec.describe 'Posts Controller', type: :request do
  describe 'GET /index' do
    it "Redirects to the user posts' page" do
      get '/users/id/posts'
      expect(response).to render_template(:index)
      expect(response.body).to include('Comments: x, Likes: x')
      expect(response.body).to include('Pagination')
    end

    it 'GET users/id/posts should succeed' do
      get '/users/id/posts'
      expect(response).to have_http_status(:ok)
    end

    it 'does not render a different template' do
      get '/users/id/posts'
      expect(response).to_not render_template(:show)
    end
  end
  describe 'GET /show' do
    it 'Redirects to the posts profile page' do
      get '/users/id/posts/id'
      expect(response).to render_template(:show)
      expect(response.body).to include('Username: Comment 10')
    end

    it 'GET users/id/posts/id should succeed' do
      get '/users/id/posts/id'
      expect(response).to have_http_status(:ok)
    end

    it 'does not render a different template' do
      get '/users/id/posts/id'
      expect(response).to_not render_template(:index)
    end
  end
end
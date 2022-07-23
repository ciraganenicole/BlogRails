Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[create]
    end
  end
  get 'users/:user_id/posts_list', to: 'api#list_all_user_posts', as: :list_all_user_posts
  get 'users/:user_id/posts/:post_id/comments_list', to: 'api#list_users_and_post_comments', as: :list_users_and_post_comments
  post 'users/:user_id/posts/:post_id/add_comment', to: 'api#add_comment', as: :add_comment
  root 'users#index'
end

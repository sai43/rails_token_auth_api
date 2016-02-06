Rails.application.routes.draw do

  resources :posts
  resources :episodes do
    get :preview, on: :collection
  end

  root 'posts#index'

end

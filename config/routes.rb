Rails.application.routes.draw do
  root 'homes#top'
  post 'inquiry' => 'inquiries#create',as:'create_inquiry'

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  scope module: :user do
    resource :users, only: [:destroy]

    patch 'user/users' => 'users#update',as:'update_users'
    patch 'user/dream_users' => 'users#dream',as:'dream_users'
    get 'user/users' => 'users#edit',as:'edit_users'
    get 'user/show_users' => 'users#show',as:'show_users'
    get 'user/new_users' => 'users#new',as:'new_users'
    get 'users/unsubscribe' => 'users#unsubscribe'
    resources :goals, only: [:new, :create, :index, :show]
    resources :tasks, only: [:show, :edit, :new, :create, :update,:destroy]
  end

  scope module: :friend do
    resources :friends, only: [:index, :create] do
      resources :comments, only: [:create]
      resources :fans, only: [:create]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

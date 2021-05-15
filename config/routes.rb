Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  root 'homes#top'

  scope module: :user do
    resource :users, only: [:destroy]

    patch 'user/users' => 'users#update',as:'update_users'
    patch 'user/dream_users' => 'users#dream',as:'dream_users'
    get 'user/users' => 'users#edit',as:'edit_users'
    get 'user/show_users' => 'users#show',as:'show_users'
    get 'user/new_users' => 'users#new',as:'new_users'
    get 'users/unsubscribe' => 'users#unsubscribe'
    resources :goals, only: [:new, :create, :index, :show]
    resources :tasks, only: [:index, :show, :edit, :new, :create, :update,:destroy]
  end

  scope module: :friend do
    resources :friends, only: [:index] do
      resources :comments, only: [:new, :create]
      resources :fans, only: [:create]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

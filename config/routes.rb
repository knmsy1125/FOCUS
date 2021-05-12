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
    get 'user/users' => 'users#edit',as:'edit_users'
    get 'user/show_users' => 'users#show',as:'show_users'
    get 'users/unsubscribe' => 'users#unsubscribe'
    resources :goals, only: [:new, :create, :index, :show]
    resources :tasks, only: [:index, :edit , :update,:destroy]
  end

  scope module: :frend do
    resources :frends, only: [:index] do
      resources :comments, only: [:new, :create]
      resources :fans, only: [:create]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

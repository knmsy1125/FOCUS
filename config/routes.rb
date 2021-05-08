Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  
  root 'user/homes#top'
  
  scope module: :user do
    resource :users, only: [:show, :edit, :update]
    get 'users/unsubscribe' => 'users#unsubscribe'
    delete 'users/withdraw'  => 'users#withdraw'
    resources :goals, only: [:new, :create, :index, :show]
    resources :tasks, only: [:index]
  end
    
  scope module: :frend do
    resources :frends, only: [:index] do
      resources :comments, only: [:new, :create]
      resources :fans, only: [:create]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

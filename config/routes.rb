Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#index'

  resources :users do
    resources :class_rooms do
      resources :class_sessions do
        resources :surveys
      end
     end
    end


  resource :sessions, only: [:new, :create, :destroy]


end

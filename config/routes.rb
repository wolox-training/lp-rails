Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'landing#index', as: 'landing'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # API Endpoints
  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: %i[json html] }) do
    resources :users do
      member do
        resources :rents, only: %i[create index]
      end
      collection do
        resources :sessions, only: [:create] do
          collection do
            post :renew
            post :invalidate_all
          end
        end
      end
    end
    resources :books, only: %i[show index]
    resources :book_suggestions, only: %i[create new]
  end
end

Rails.application.routes.draw do
  devise_for :users#, controllers: { sessions: 'users/sessions' }

  resources :wikis

  resources :charges, only: [:new, :create]

  root 'welcome#index'

  get 'downgrade' => 'downgrade'

end

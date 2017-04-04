Rails.application.routes.draw do
  devise_for :users#, controllers: { sessions: 'users/sessions' }

  resources :wikis

  root 'welcome#index'

end

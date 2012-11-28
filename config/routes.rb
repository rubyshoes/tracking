Tracking::Application.routes.draw do

  root to: 'pages#home'

  resources :employees
  resources :clients
  resources :codes
  resources :codelines
  resources :contracts
  resources :sessions, only:  [:new, :create, :destroy]

  match '/employees/:id', to:     'employees#show', :as => :employee
  match '/newemployee',   to:     'employees#new'
  match '/signin',        to:     'sessions#new'
  match '/signout',       to:     'sessions#destroy', via: :delete
  match '/home',          to:     'pages#home'
  match '/about',         to:     'pages#about'
  match '/contact',       to:     'pages#contact'
  match '/help',          to:     'pages#help'

end

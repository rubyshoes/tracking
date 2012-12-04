Tracking::Application.routes.draw do

  root to: 'pages#home'
  
  # Refactored routes to make nearly all resourceful. 

  resources :employees
  resources :clients
  resources :codes
  resources :codelines
  resources :contracts
  resources :sessions, only:  [:new, :create, :destroy]
  
  
  match '/get_client_data', to:   'clients#get_client_data' # Added this route for the autocomplete functionality.
  match '/get_code_data',   to:   'codes#get_code_data' # Added this route for the autocomplete functionality.
  match '/employees/:id',   to:     'employees#show', :as => :employee
  match '/newemployee',     to:     'employees#new'
  match '/signin',          to:     'sessions#new'
  match '/signout',         to:     'sessions#destroy', via: :delete
  match '/home',            to:     'pages#home'
  match '/about',           to:     'pages#about'
  match '/contact',         to:     'pages#contact'
  match '/help',            to:     'pages#help'

end

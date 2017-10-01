Rails.application.routes.draw do

  resources :funding_applications
  resources :funding_application_submissions

  devise_for :users, :controllers => { :registrations => "registrations" }

  root 'pages#home'

  get 'pages/home'

  get '/login', to: 'users#login', as: 'login'
  get '/signup', to: 'users#signup', as: 'signup'

  get '/settings/account', to: 'accounts#settings', as: 'account_settings'

  get '/settings/my-profile', to: 'accounts#edit_my_profile', as: 'edit_my_profile'

  get '/settings/payments', to: 'accounts#payments', as: 'edit_payment_methods'

  get '/memberships/choose_level', to: 'memberships#choose', as: 'choose_membership'

  get '/memberships/checkout/:membership_id', to: 'memberships#checkout', as: 'checkout_membership'

  get '/apply/:funding_application_id', to: 'funding_application_submissions#initiate', as: 'initiate_funding_application_submission'

  get '/admin/dashboard/', to: 'admin#dashboard', as: 'admin_dashboard'

  post 'complete_checkout' => "memberships#complete_checkout"

  post 'update_payment_information' => 'accounts#update_payment_information'

  #get '/funding_applications', to: 'funding_applications#index', as: 'funding_applications'
  #get '/funding_applications/new', to: 'funding_applications#new', as: 'new_funding_application'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

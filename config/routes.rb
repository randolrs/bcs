Rails.application.routes.draw do

  devise_for :users
  root 'pages#home'

  get 'pages/home'

  get '/settings/account', to: 'accounts#settings', as: 'account_settings'

  get '/settings/my-profile', to: 'accounts#edit_my_profile', as: 'edit_my_profile'

  get '/settings/payments', to: 'accounts#payments', as: 'edit_payment_methods'

  get '/memberships/choose_level', to: 'memberships#choose', as: 'choose_membership'

  get '/memberships/checkout/:membership_id', to: 'memberships#checkout', as: 'checkout_membership'

  post 'complete_checkout' => "memberships#complete_checkout"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

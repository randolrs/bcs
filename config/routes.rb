Rails.application.routes.draw do

  resources :votable_projects
  resources :syndicates
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

  get 'funding_applications/questions/:funding_application_id', to: 'funding_applications#edit_questions', as: 'edit_funding_application_questions'

  get 'funding_application_submission/update/accept_for_interview/:funding_application_submission_id', to: 'funding_application_submissions#approve_for_interview_and_return', as: 'approve_for_interview_and_return'
  get 'funding_application_submission/update/reject_for_interview/:funding_application_submission_id', to: 'funding_application_submissions#reject_for_interview_and_return', as: 'reject_for_interview_and_return'

  get 'funding_application_submission/update/accept_for_voting/:funding_application_submission_id', to: 'funding_application_submissions#approve_for_voting', as: 'approve_for_voting'
  get 'funding_application_submission/update/reject_for_voting/:funding_application_submission_id', to: 'funding_application_submissions#reject_for_voting', as: 'reject_for_voting'


  get '/admin/dashboard/', to: 'admin#dashboard', as: 'admin_dashboard'

  get '/vote/', to: 'votable_projects#votable_index', as: 'votable_project_index'

  get 'users/join_syndicate/:syndicate_id', to: 'users#join_syndicate', as: 'user_join_syndicate'

  get 'users/upvote/:funding_application_submission_id', to: 'users#upvote_submission', as: 'user_upvote_submission'

  get 'users/downvote/:funding_application_submission_id', to: 'users#downvote_submission', as: 'user_downvote_submission'

  post 'complete_checkout' => "memberships#complete_checkout"

  post 'update_payment_information' => 'accounts#update_payment_information'

  #get '/funding_applications', to: 'funding_applications#index', as: 'funding_applications'
  #get '/funding_applications/new', to: 'funding_applications#new', as: 'new_funding_application'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

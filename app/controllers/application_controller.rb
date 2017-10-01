class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  Stripe.api_key = ENV['STRIPE_SECRET_KEY']

	def after_sign_in_path_for(user)

		unless current_user.id
			choose_membership_path
		else
			choose_membership_path
		end

	end


	def after_sign_out_path_for(user)
		root_path
	end

  def configure_permitted_parameters

    registration_params = [:email, :password, :stripe_customer_id, :first_name, :last_name, :payment_active, :image, :is_admin]
    devise_parameter_sanitizer.permit(:sign_up, keys: registration_params)
    devise_parameter_sanitizer.permit(:sign_in, keys: registration_params)
    devise_parameter_sanitizer.permit(:account_update, keys: registration_params)

  end

end

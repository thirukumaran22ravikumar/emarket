class RegistrationsController < ApplicationController

	prepend_before_action :authenticate_scope!, only: [:edit,:change_account,:update, :destroy]
	def new
	flash[:info] = 'Registrations are not open yet, but please check back soon'
	redirect_to "/"
	end

	def create
	flash[:info] = 'Registrations are not open yet, but please check back soon'
	redirect_to "/"
	end

	def change_account
		render :change_account
	end

	def update
		account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
		if account_update_params[:password].blank?
	  		account_update_params.delete("password")
	  		account_update_params.delete("password_confirmation")

	    	@user = User.find(current_user.id)

	    	if @user.update(account_update_params)
	      		set_flash_message :notice, :updated
	      		# Sign in the user bypassing validation in case their password changed
	     		 sign_in @user, :bypass => true
	      		redirect_to after_update_path_for(@user)
	    	else
	      		render "change_account"
	    	end
		else
			super
		end
	end

end

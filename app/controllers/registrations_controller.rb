class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    #complete this method
			@user = User.create(registration_params)

			if @user.valid?
        flash[:error] = "Created the user"
				redirect_to root_path
      else
        flash[:error] = "We were unable to create the user"
        redirect_to sign_in_path
			end
  end

  def registration_params
    params.require(:registrations).permit(:name, :last_name, :email, :phone ,:password,)
  end
end

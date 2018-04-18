class SessionsController < ApplicationController
	def new
	end

	def create
    user = User.find_by(email: sessions_params[:email])
		if(user!=nil)
		  if(user.password == sessions_params[:password])
			  flash[:notice] = "Logged In."
				redirect_to action: "show", controller: 'users', id: user.id

      end
    end
    if(user==nil)
      flash[:notice] = "Unable to create the user."
      redirect_to log_in_path
    end
	end

	def destroy
		#complete this method
	end

	def sessions_params
		params.require(:session).permit(:email, :password)
  end

  def is_logged
    true
  end
end

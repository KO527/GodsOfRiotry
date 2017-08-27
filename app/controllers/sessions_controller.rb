class SessionsController < ApplicationController

	def new
		
	end

	def show
		render template: "sessions/#{params[:page]}"
	end
	
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
		    log_in user
		    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
		    redirect_back_or user
		else
			flash.now[:danger] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def omniauth_create
		auth = request.env['omniauth.auth']
		session[:omniauth] = auth.except('extra')
		user = User.sign_in_from_omniauth(auth)
		session[:user_id] = user.id
		redirect_to '/users/show', notice: "Signed in as auth"
	end

	def failure
		flash[:notice] = params[:message]
		redirect '/'
	end	

	def destroy 
		log_out if logged_in?
		session[:omniauth] = nil
		session[:user_id] = nil
 		redirect_to root_url, notice: 'SIGNED OUT'
	end

	
	def is_admin?
		current_user.role == 'admin'
	end
	# protected 

	# 	def auth_hash
	# 		request.env['omniauth.auth']
	# 	end
end

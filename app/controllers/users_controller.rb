class UsersController < ApplicationController
	before_action :logged_in_user, only: [:show, :index, :edit, :update]	
	before_action :correct_user, only: [:edit, :update]
	before_action :admin_user, only: [:index] 
	

	def index
		@users = User.paginate(page: params[:page])
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def edit
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
			flash[:success] = "Welcome to GodsOfRiotry" + @user.first_name + "!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
	end
#before filters

	private

	def logged_in_user
	    unless logged_in?
	    	store_location
	    	flash[:danger] = "Please log in."
	    	redirect_to login_url
	    end
	end

	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_url) unless current_user?(@user)
	end


	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :uid, :provider_location, :provider_full_name, :provider_nickname, :access_token)
	end
end

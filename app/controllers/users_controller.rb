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

	private

		def next_piece_of_info
			respond_to do |format|
				unless logged_in?
						render partial: 'basic_info'
						format.js
					if basic_info_params.valid?
						render partial: 'gender'
						format.js
					elsif gender_params.valid?
						render partial: 'artists_preferences'
						format.js
					elsif artists_preferences.valid?
						render partial: 'soundcloud_connect'
						format.js
					else
						return;
					end
				end
			end
		end

		def gender_params
			params.require(:user).permit(:gender)
		end

		def basic_info_params
			params.require(:user).permit(:fullname, :email, :password, :password_confirmation)
		end

		def artists_preferences_params
			params.require(:user).permit(:artist1, :artist2, :artist3, :artist4, :artist5)
		end


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

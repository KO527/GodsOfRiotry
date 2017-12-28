class UsersController < ApplicationController
	before_action :logged_in_user, only: [:show, :index, :edit, :update]	
	before_action :correct_user, only: [:edit, :update]
	before_action :is_admin?, only: [:index] 
	before_action :validate_minimum_number_of_artists_have_not_been_reached, only: [:create]
	before_action :validate_maximum_number_of_artists_have_been_reached, only: [:create]

	def index
		@users = User.paginate(page: params[:page])
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		next_piece_of_info
	end

	def edit
	end

	def create
		@user = User.new(basic_info_params, artists_preferences, gender_params)
		if @user.save
			log_in @user
			flash[:success] = "Welcome to GodsOfRiotry " + @user.first_name + "!"
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
					# elsif artists_preferences.valid?
					# 	render partial: 'soundcloud_connect'
					# 	format.js
					else
						return
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
			params.require(:user).permit(:preference_attributes => [:artists_attributes => [:artist, :artist, :artist, :artist, :artist]])
		end

		def user_params
			gender_params
			basic_info_params
			artists_preferences_params
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

end

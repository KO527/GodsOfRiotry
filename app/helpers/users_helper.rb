module UsersHelper

	def admin_user
	    redirect_to(root_url) unless current_user.admin?
	end


	def remember(user)
   	    user.remember
   	    cookies.permanent.signed[:user_id] = user.id
   	    cookies.permanent[:remember_token] = user.remember_token
	end

	def log_in(user)
	    session[:user_id] = user.id
	end

	def log_out
	    session.delete(:user_id)
	    @current_user = nil
	end

	def subscribe_to(resource)
		preferences << resource 
	end

	def unsubscribe_to(resource)
		preferences.delete(resource)
	end

	def subscribed_to?(resource)
		preferences.include?(resource)
	end

end
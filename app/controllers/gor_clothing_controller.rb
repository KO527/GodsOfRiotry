class GorClothingController < ApplicationController
before_action :logged_in_user
before_action :user_admin


def index
     @Gor_Clothings = Gor_Clothing.all
end

def new
     @Gor_Clothing = Gor_Clothing.new
end

def create
     @Gor_Clothing.new(Clothing_params)
end

def edit
 
end

def update
	if @Gor_Clothing.update_attributes(Clothing_params)
		flash[:success] = "Profile updated"
		redirect_to @Gor_Clothing
	else
		render 'edit'
	end
end

def destroy
	
end


private

	def Clothing_params
	    params.require(:Gor_Clothing).permit(:image, :price, :description, :quantity)
	end

end






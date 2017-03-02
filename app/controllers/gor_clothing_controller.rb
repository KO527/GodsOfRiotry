class GorClothingController < ApplicationController
before_action :logged_in_user
before_action :admin, only: [:update, :edit, :new, :create, :destroy]


def index
     @Gor_Clothings = Gor_Clothing.all
end

def show #js Show details Price and Description
     @Gor_Clothing = Gor_Clothing.find(params[:id])
end

def new
     @Gor_Clothing = Gor_Clothing.new
     Image.new
end

 def create
      @Gor_Clothing.new(Gor_Clothing_params)
      if @Gor_Clothing.assign_attributes('description' => params[:description],
      					   'size' => params[:size],
      					   'gender' => params[:gender],
      					   'price' => params[:price],
      					   'quantitiy' => params[:quantity])
      	render 'images/preview'
      else
      	render 'new'
      end
 end
#      	render preview_new_gor_clothing_path


def edit
     @Gor_Clothing.find(params[:id]) #create edit page
end

def update
	@Gor_Clothing = Gor_Clothing.find(params[:id])
	if @Gor_Clothing.update(Gor_Clothing_params)
		flash[:success] = "Successful upload"
		render 'show_detail'
	else
		render 'edit'
	end
end

def destroy
	@Gor_Clothing = Gor_Clothing.find(params[:id])
	@Gor_Clothing.destroy

	redirect_to Gor_Clothing_path
end


private

	def Gor_Clothing_params
	    params.require(:Gor_Clothing).permit(images_attributes: [:picture, :type_of_image, :_destroy], :price, :description, :quantity, :gender, :size)
	end

end





 
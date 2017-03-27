class GorClothingController < ApplicationController
	before_action :logged_in_user
	before_action :admin, only: [:update, :edit, :new, :create, :destroy, :detail]


	def index
	     @Gor_Clothings = Gor_Clothing.all
	end

	def show #js Show details Price and Description
	     @Gor_Clothing = Gor_Clothing.find(params[:id])
	end

	def new
	     @Gor_Clothing = Gor_Clothing.new
	end

	 def create
	      if @Gor_Clothing.new('description' => params[:description],
	      			      'size' => params[:size],
	      			      'gender' => params[:gender],
	      	        	                'price' => params[:price],
	      		                'quantitiy' => params[:quantity],
	      		                'picture' => params[:image][:picture])
	      	redirect_to 'images/new'
	      else
	      	render 'new'
	      end
	 end
	#      	render preview_new_gor_clothing_path


	def edit
	     @Gor_Clothing = Gor_Clothing.find(params[:id])	      #render edit page
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
	
	# def detail
	# end
private

	def Gor_Clothing_params
	    params.require(:Gor_Clothing).permit(:price, :description, :quantity, :gender, :size, images_attributes: [:picture, :type_of_image, :_destroy])
	end

end





 
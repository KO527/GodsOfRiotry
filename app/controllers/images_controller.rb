class ImagesController < ApplicationController
	
	before_action :admin, only: [:edit, :preview, :new, :create]

	validate :picture_size

	def new
		@image = Image.new
	end

	 # def create
	 #  	@image = Image.new(Image_params)
		
	 #  	render Gor_clothing/show
	 #  end

	def show
		@image = Gor_Clothing.find(params[:gor_clothing_id][:image][:show_picture])
	end
	
	def index
		@gor_clothing = Gor_Clothing.find(params[:gor_clothing_id])
		@images = @gor_clothing.Images.all
	end

	def edit_some
		@gor_clothing = Gor_Clothing.find(params[:gor_clothing_id])

		respond_to do |format|
			format.js{}
			format.html{}
		end
	end

	
	def destroy
		@gor_clothing = Gor_Clothing.find(params[:gor_clothing_id])
		if params[:collateral_images].nil	
			render detail_gor_clothing_path(@gor_clothing)
		else
		  	@images = Image.find(params[:collateral_images]) #identify which images have setForDeletion
		  	@images.destroy
		  	render detail_gor_clothing_path(@gor_clothing)
		end				
		respond_to do |format|
				format.js{} #collapse .setForDeletion and .icon-destroy-link classes
		  		format.html{}
		end
	end

	def preview #show form through js
		respond_to do |format|
			format.js{}
			format.html{}
		end
	end

	private

		
		def Image_params
			params.require(:Image).permit(:type_of_image, :picture)
		end
end

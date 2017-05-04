class ImagesController < ApplicationController
	respond_to :js

	before_action :admin, only: [:edit_some, :preview, :new, :create]
	before_action :find_clothing, only: [:index, :show, :edit_some, :destroy, :preview]
	validate :picture_size

	def new
		@image = Image.new
	end

	def show
		@image = @gor_clothing.Images.where(type_of_image: :show_picture)
	end
	
	def index
		@images = @gor_clothing.Images.all
	end

	def edit_some
	end

	def destroy
		#respond_with js, html
	 	@images = Image.where(:type_of_image => params[:collateral_images]) #identify which images have setForDeletion
		if params[:collateral_images].nil	
			render detail_gor_clothing_path(@gor_clothing)
		else
		  	@images.destroy
		  	respond(@gor_clothing, action: :edit_some)
		end
	end

	def preview #show form through js
	end

	private

		def find_clothing
			@gor_clothing = Gor_Clothing.find(params[:gor_clothing_id])
		end

		def Image_params
			params.require(:Image).permit(:type_of_image, :picture)
		end
end

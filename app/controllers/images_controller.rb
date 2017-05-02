class ImagesController < ApplicationController
	respond_to :js

	before_action :admin, only: [:edit, :preview, :new, :create]
	before_action :find_clothing, only: [:index, :show, :edit_some, :destroy, :preview]
	validate :picture_size

	def new
		@image = Image.new
	end

	def show
		@gor_clothing = Gor_Clothing.find(params[:gor_clothing_id])
		@image = @gor_clothing.Images.where(type_of_image: :show_picture)
	end
	
	def index
		@gor_clothing = Gor_Clothing.find(params[:gor_clothing_id])
		@images = @gor_clothing.Images.all
	end

	def edit_some
		@gor_clothing = Gor_Clothing.find(params[:gor_clothing_id])
	end

	def destroy
		#respond_with js, html
		@gor_clothing = Gor_Clothing.find(params[:gor_clothing_id])
	 	@images = Image.where(:type_of_image => params[:collateral_images]) #identify which images have setForDeletion
		if params[:collateral_images].nil	
			respond_with(@gor_clothing)
		else
		  	@images.destroy
		  	redirect_to detail_gor_clothing_path(@gor_clothing)
		end
	end

	def preview #show form through js
		@gor_clothing = Gor_Clothing.find(params[:gor_clothing_id])
	end

	private

		def find_clothing
			@gor_clothing = Gor_Clothing.find(params[:gor_clothing_id])
		end

		def Image_params
			params.require(:Image).permit(:type_of_image, :picture)
		end
end

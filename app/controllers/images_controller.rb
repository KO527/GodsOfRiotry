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
		@images = @gor_clothing.Images.all
		respond_with(@gor_clothing, @images, location: admin_gor_clothing_index_path)
	end

	def destroy
	 	@images = Image.where(:type_of_image => params[:collateral_images]) #identify which images have setForDeletion
		if params[:collateral_images].nil
			@images = @gor_clothing.Images.all	
			render admin_gor_clothing_index_path
		else
		  	@images.destroy
		  	respond_with(@gor_clothing, action: :edit_some) #gor_clothing should refer to gor_clothing/detail
		end
	end

	def preview #show form through js
		respond_with(@gor_clothing, @image, location: preview_new_admin_gor_clothing_path)
	end

	private

		def Image_params
			params.require(:Image).permit(:type_of_image, :picture)
		end
end

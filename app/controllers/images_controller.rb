class ImagesController < ApplicationController
	
	before_action :admin, only: [:edit, :preview, :new, :create, :update]

	validate :picture_size

	def new
		@image = Image.new		
	end

	 # def create
	 #  	@image = Image.new(Image_params)
		
	 #  	render Gor_clothing/show
	 #  end

	def show
		@image = Gor_clothing.find(params[:gor_clothing_id][:image][:show_picture])
	end

	# Finished editing button updates Images
	def update
		@image = Images.find(params[:id])
		@image.update_attributes(Image_params)
		
	end
	
	def index
		@gor_clothing = Gor_Clothing.find(params[:gor_clothing_id])
		@images = @gor_clothing.Images.all
	end

	def edit_some
		@gor_clothing = Gor_Clothing.find(params[:gor_clothing_id])
	end


	def destroy
		@gor_clothing = Gor_Clothing.find(params[:gor_clothing_id])
		
		respond_to do |format|
				format.js {} #collapse .setForDeletion and .icon-destroy-link classes
		  		format.html {
		  			if params[:setForDeletion].nil	
						render detail_gor_clothing_path(@gor_clothing)
					else
		  				@images = Image.find(params[:setForDeletion]) #identify which images have setForDeletion
		  				@images.destroy
		  				render detail_gor_clothing_path(@gor_clothing)
		  		}
		end
	end

	def preview #show form through js
		@gor_clothing = Gor_clothing.find(params[:gor_clothing_id])

		if @gor_clothing.new_record?
			@image = Image.create({'type_of_image' => params[:type_of_image],
			 	            'picture' => params[:picture]})
		else 
			@gor_clothing.persisted?
			@image = Image.new({'type_of_image' => params[:type_of_image],
						  'picture' => params[:picture]})
			@image.save
		end

		render 'gor_clothing/show'
	end

	private

		
		def Image_params
			params.require(:Image).permit(:type_of_image, :picture)
		end
end

class GorClothingController < ApplicationController
	before_action :logged_in_user
	before_action :admin, only: [:update, :edit, :new, :create, :destroy, :detail]


	def index
	     @gor_clothings = Gor_Clothing.all
	end

	def show #js Show details Price and Description
	     @gor_clothing = Gor_Clothing.find(params[:id])
	end

	def new
	     @gor_clothing = Gor_Clothing.new
	     if @gor_clothing.attribute_present?(:description, :size, :gender, :price, :quantity, :picture)
	     	@gor_clothing.build(gor_clothing_params)
	     		image_preview
     	     end
	end

	def create
	 	@gor_clothing = Gor_Clothing.new(gor_clothing_params)
	          if @gor_clothing.new_record?
		 	if @gor_clothing.save
		 		redirect_to detail_admin_gor_clothing_path(@gor_clothing) 
		 	elsif @gor_clothing.images_attributes.invalid?
		 		image_preview
		 	else
		 		render 'new'
		 	end

		elsif @gor_clothing.persisted?
	 		if @gor_clothing.update(:images_attributes => {'type_of_image' => params[:type_of_image],
	 				  'picture' => params[:picture]})
	 			redirect_to detail_admin_gor_clothing_path(@gor_clothing)
	 		else
	 			image_preview
	 		end
		end		
	end
	#      	render preview_new_gor_clothing_path


	def edit
	     @gor_clothing = Gor_Clothing.find(params[:id])	      #render edit page
	end

	def update
		@gor_clothing = Gor_Clothing.find(params[:id])
		if @gor_clothing.update(gor_clothing_params)
			flash[:success] = "Successful upload"
			render detail_admin_gor_clothing_path(@gor_clothing)
		else
			render 'edit'
		end
	end

	def destroy
		@gor_clothing = Gor_Clothing.find(params[:id])
		@gor_clothing.destroy

		redirect_to admin_gor_clothing_index_path
	end
	
	def detail
		@gor_clothing = Gor_Clothing.find(params[:id])
	end

	private

		def gor_clothing_params
		    params.require(:Gor_Clothing).permit(:price, :description, :quantity, :gender, :size, images_attributes: [:picture, :type_of_image, :_destroy])
		end

end





 
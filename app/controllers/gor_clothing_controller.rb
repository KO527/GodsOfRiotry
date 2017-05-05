class GorClothingController < ApplicationController
	before_action :logged_in_user
	before_action :admin, only: [:update, :edit, :new, :create, :destroy, :detail]
	before_action :find_clothing, only: [:index, :show, :edit, :update, :destroy, :detail]
	respond_to :html, :js

	def index
	     @gor_clothings = Gor_Clothing.all
		if current_user.gender == :female
			@gor_clothing_next = @gor_clothing.next_female
			@gor_clothing_previous = @gor_clothing.previous_female
		elsif current_user.gender == :male
			@gor_clothing_next = @gor_clothing.next_male
			@gor_clothing_previous = @gor_clothing.previous_male
		end
		respond_with(@gor_clothing, location: admin_gor_clothing_index_path)
	end

	def show #js Show details Price and Description
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
	 		if @gor_clothing.create(:images_attributes => {'type_of_image' => params[:type_of_image],
	 				  'picture' => params[:picture]})
	 			redirect_to detail_admin_gor_clothing_path(@gor_clothing)
	 		else
	 			image_preview
	 		end
		end		
	end
	#      	render preview_new_gor_clothing_path


	def edit
	     respond_with(@gor_clothing, edit_admin_gor_clothing_path(@gor_clothing))
	end

	def update
		if @gor_clothing.update(gor_clothing_params)
			flash[:success] = "Successful upload"
			redirect_to admin_gor_clothing_index_path
		else
			render 'edit'
		end
	end

	def destroy
		@gor_clothing.destroy

		redirect_to admin_gor_clothing_index_path
	end
	
	def detail
		respond_with(@gor_clothing, location: admin_gor_clothing_index_path) # gor_clothing index should include detail
	end

	private

		def find_clothing
			@gor_clothing = Gor_Clothing.find(params[:id])
		end

		def gor_clothing_params
		    params.require(:Gor_Clothing).permit(:price, :description, :quantity, :gender, :size, images_attributes: [:picture, :type_of_image, :_destroy])
		end	

end


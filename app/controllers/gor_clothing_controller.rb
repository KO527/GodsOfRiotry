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
		respond_with(@gor_clothings, :location => admin_gor_clothing_index_path)
	end

	def show #js Show details Price and Description
	end

	def new
	     @gor_clothing = Gor_Clothing.new
	end

	def create
	 	@gor_clothing = Gor_Clothing.new(gor_clothing_params)
	          if @gor_clothing.new_record?
		 	if @gor_clothing.save
		 		redirect_to new_admin_possible_match_path
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


	def edit
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
		@gor_clothing.destroy!

		redirect_to admin_gor_clothing_index_path
	end
	
	def detail
		respond_with(@gor_clothing, :location => admin_gor_clothing_index_path)
	end

	private

		def gor_clothing_params
		    params.require(:Gor_Clothing).permit(:price, :description, :quantity, :gender, :size, images_attributes: [:picture, :type_of_image])
		end	

end


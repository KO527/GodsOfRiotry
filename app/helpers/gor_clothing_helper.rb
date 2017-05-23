module GorClothingHelper

	def image_preview
		render 'images/new_preview' unless @gor_clothing.errors.count > 0 #render layout
	end

	def find_clothing
		@gor_clothing = Gor_Clothing.find(params[:gor_clothing_id])
	end

end

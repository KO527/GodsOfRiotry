module GorClothingHelper

	def image_preview
		render 'images/preview' unless @gor_clothing.errors.count > 0
	end

	def find_clothing
		@gor_clothing = Gor_Clothing.find(params[:gor_clothing_id])
	end

end

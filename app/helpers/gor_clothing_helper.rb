module GorClothingHelper

	def image_preview
		render 'images/preview' unless @gor_clothing.errors.count > 0
	end

end

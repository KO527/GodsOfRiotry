class ImagesController < ApplicationController


	validate :picture_size

	def new
		
	end

	private

		
		def Image_params
			params.require(:Image).permit(:type_of_image, :picture)
		end
end

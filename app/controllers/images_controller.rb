class ImagesController < ApplicationController


	validate :picture_size


	private

		
		def Images_params
			params.require(Images_params).permit(:type_of_image, :picture)
		end
end

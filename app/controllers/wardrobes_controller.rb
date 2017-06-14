class WardrobesController < ApplicationController
	
	layout 'main_display'

	# def index 
	# 	@gor_clothings = Gor_clothing.all
	# 	@past_wardrobes = current_user.wardrobes.all
	# 	@past_wardrobes.each do |past_wardrobe| 
	# 		past_wardrobe.gor_clothings.each do |clothing_piece|
	# 			if @gor_clothings.include?(clothing_piece) && @gor_clothing.clothing_piece.count < 5
	# 				@how_many_left = gor_clothing.clothing_piece.count
	# 			elsif @gor_clothings.include?(clothing_piece) && @gor_clothing.clothing_piece.count > 5
	# 				@how_many_left = {}
	# 			elsif @gor_clothings.exclude?(clothing_piece)
	# 				@how_many_left = "none exist"
	# 			else
	# 				next
	# 			end
	# 		end
	# 	end
	# end


	def update
		PossibleMatch.find(params[][])
	end

	private

		def wardrobe_params
			params.require(:wardrobe).permit(gor_clothing_attributes: [:image, :_destroy])
		end

end
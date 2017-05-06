module PossibleMatchesHelper

	def contemplated_piece
		@gor_clothing = Gor_Clothing.find(params[:contemplated_piece_id])
	end	
end

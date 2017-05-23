module PossibleMatchesHelper

	def contemplated_piece
		@possible_match = PossibleMatch.new(contemplated_piece_id: params[:gor_clothing_id])
	end

	def possible_matches
		@gor_clothing = Gor_Clothing.find(params[:contemplated_piece_id])
		@possible_matches = @gor_clothing.suggested_pieces(:all)
	end

end

module PossibleMatchesHelper

	def contemplated_piece
		@possible_match = PossibleMatch.new(contemplated_piece_id: params[:gor_clothing_id])
	end

	def possible_matches 
		@possible_matches = @gor_clothing.suggested_pieces(:all)
	end

end

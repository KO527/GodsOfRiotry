class PossibleMatchesController < ApplicationController
	before_action :contemplated_piece

	def new
		@gor_clothing = Gor_Clothing.find()
	end
	
	def edit
		@possible_matches = @gor_clothing.suggested_pieces(:all)
	end

	def update
	end

	def destroy
		@possible_matches = @gor_clothing.suggested_pieces() #all of the images with setForDeletion links
	end

	private

	def contemplated_piece
		@gor_clothing = PossibleMatch.find(params[:contemplated_piece_id])
	end
end

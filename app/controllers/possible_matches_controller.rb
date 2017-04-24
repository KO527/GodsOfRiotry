class PossibleMatchesController < ApplicationController
	before_action :contemplated_piece

	def new
		@possible_matches = Gor_clothing.all
		respond_with()
	end
	
	def index 
		@possible_matches = @gor_clothing.suggested_pieces(:all)
	end
	
	def edit
		@possible_matches = @gor_clothing.suggested_pieces(:all)
	end

	def update
	end

	def destroy
		@possible_matches = @gor_clothing.suggested_pieces() #all of the images with setForDeletion links
		respond_to do |format|
			format.js{}
			format.html{}
		end
	end

	private

	def contemplated_pieces
		@contemplated_pieces = PossibleMatch.find(params[:contemplated_piece_id]).all
	end
end

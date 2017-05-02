class PossibleMatchesController < ApplicationController
	before_action :contemplated_piece
	before_action :contemplated_pieces
	respond_to :js, :html

	def new
		@possible_matches = Gor_clothing.all
	end
	
	def index 
	end
	
	def edit
		respond_with(@possible_matches)
	end

	def update
	end

	def destroy
		@possible_matches = @gor_clothing.suggested_pieces(:all) #all of the images with setForDeletion links
		@possible_matches_selected = PossibleMatch.where(:suggested_pieces => params[:collateral_images]) #identify which images have setForDeletion
		if @possible_matches_selected.destroy
			flash[:notice] = "Selected possible matches destroyed"
			respond_with(@gor_clothing, @possible_matches, :action => possible_matches_edit_admin_gor_clothing(@gor_clothing, @possible_matches_selected))
		end
	end

	private

		def contemplated_piece
			@gor_clothing = Gor_Clothing.find(params[:contemplated_piece_id])
		end

		def contemplated_pieces
			@contemplated_pieces = PossibleMatch.find(params[:contemplated_piece_id]).all
		end
end

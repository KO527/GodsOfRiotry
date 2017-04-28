class PossibleMatchesController < ApplicationController
	before_action :contemplated_piece
	respond_to :html, :js

	def new
		@possible_matches = Gor_clothing.all
		respond_with()
	end
	
	def index 
		@possible_matches = @gor_clothing.suggested_pieces(:all)
	end
	
	def edit
		@possible_matches = @gor_clothing.suggested_pieces(:all)
		respond_with(@possible_matches)
	end

	def update
	end

	def destroy
		# @possible_matches = @gor_clothing.suggested_pieces(:all) #all of the images with setForDeletion links
		@gor_clothing = Gor_Clothing.find(params[:gor_clothing_id])
		@possible_matches_selected = PossibleMatch.where(:suggested_pieces => params[:collateral_images]) #identify which images have setForDeletion
		flash[:notice] = "Selected possible matches destroyed" if @possible_matches_selected.destroy
		respond_with(@gor_clothing, :location => detail_gor_clothing_url)
	end

	private

	def contemplated_pieces
		@contemplated_pieces = PossibleMatch.find(params[:contemplated_piece_id]).all
	end
end

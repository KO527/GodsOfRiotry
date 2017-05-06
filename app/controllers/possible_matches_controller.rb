class PossibleMatchesController < ApplicationController
	before_action :contemplated_piece, only: [:index, :edit, :destroy]
	before_action :admin, only: [:new, :edit, :destroy]
	# before_action :contemplated_pieces
	respond_to :js, :html

	def new
		# @gor_clothings = Gor_Clothing.all
		# if @gor_clothing.
		# 	@possible_matches = Gor_clothing.all
		# else
	end

	def create
		
	end

	def index		
	end
	
	def edit
		@possible_matches = @gor_clothing.suggested_pieces(:all)
	end

	def update
	end

	def destroy
		@possible_matches = @gor_clothing.suggested_pieces(:all) #all of the images with setForDeletion links
		@possible_matches_selected = PossibleMatch.where(:suggested_pieces => params[:collateral_images]) #identify which images have setForDeletion
		if @possible_matches_selected.destroy
			flash[:notice] = "Selected possible matches destroyed"
		end
 		respond_with(@gor_clothing, location: admin_gor_clothing_index_path)
	end

end

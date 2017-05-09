class PossibleMatchesController < ApplicationController
	before_action :contemplated_piece, only: [:new, :index, :create, :edit, :destroy]
	before_action :admin, only: [:new, :edit, :destroy]
	# before_action :contemplated_pieces
	respond_to :js, :html

	def new
		@gor_clothings = Gor_Clothing.all
		@possible_matches = PossibleMatch.new
		respond_with(@gor_clothings)
	end

	def create
		@possible_matches = PossibleMatch.new(possible_matches_params)
		flash[:notice] = "Possible matches for this gor_clothing piece created" if @possible_matches.save
		redirect_to admin_gor_clothing_index_path
	end

	def index
	end
	
	def edit
		@possible_matches = @gor_clothing.suggested_pieces(:all)
		respond_with(@gor_clothing, @possible_matches, location: admin_gor_clothing_index_path)
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

	private 

		def possible_matches_params	
			params.require(PossibleMatch).permit(:suggested_piece)
		end

end

class PossibleMatchesController < ApplicationController
	before_action :admin, only: [:new, :create, :edit, :destroy]
	respond_to :js, :html

	layout 'final_preparation', only: [:new, :edit]
	layout 'main_display', only: [:show]

	def new
		@gor_clothings = Gor_Clothing.all
		@possible_match = PossibleMatch.new(contemplated_piece_id: params[:gor_clothing_id])
	end

	def create 
		@possible_match = PossibleMatch.create(possible_matches_params)
		flash[:notice] = "Possible matches for this gor_clothing piece created" if @possible_matches.save
	end

	def show
		@possible_matches = PossibleMatch.find(:all)
	end

	def index
	end
	
	def edit
		@gor_clothing = Gor_Clothing.find(params[:contemplated_piece_id])
		@possible_matches = @gor_clothing.suggested_pieces(:all)
	end

	def update
	end

	def destroy
		@possible_matches_selected = PossibleMatch.where(:suggested_pieces => params[:collateral_images]) #identify which images have setForDeletion
		if @possible_matches_selected.destroy
			flash[:notice] = "Selected possible matches destroyed"
		end
	end

	private 

		def possible_matches_params	
			params.require(PossibleMatch).permit(:contemplated_piece, :suggested_piece)
		end

end

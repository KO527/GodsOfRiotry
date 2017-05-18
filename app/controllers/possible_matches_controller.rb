class PossibleMatchesController < ApplicationController
	before_action :contemplated_piece, only: [:new, :index, :create, :edit, :destroy]
	before_action :admin, only: [:new, :edit, :destroy]
	before_action :possible_matches, only: [:create, :edit]
	respond_to :js, :html

	layout 'final_preparation', only: [:new, :edit]


	def new
		@gor_clothing = Gor_Clothing.find(params[:gor_clothing_id])
		@gor_clothings = Gor_Clothing.all #except contemplated_piece
		@possible_match.build
		respond_with(@gor_clothing, :location => '/eval')
	end

	def create
		@possible_match.update_attributes(possible_matches_params)
		flash[:notice] = "Possible matches for this gor_clothing piece created" if @possible_matches.save
		respond_with(@gor_clothing, @possible_matches, :location => admin_gor_clothin)
	end

	def show
		PossibleMatch.find(:all)
	end

	def index
	end
	
	def edit
		respond_with(@gor_clothing, @possible_matches, location: admin_gor_clothing_index_path)
	end

	def update
	end

	def destroy
		@possible_matches_selected = PossibleMatch.where(:suggested_pieces => params[:collateral_images]) #identify which images have setForDeletion
		if @possible_matches_selected.destroy
			flash[:notice] = "Selected possible matches destroyed"
		end
 		respond_with(@gor_clothing, location: admin_gor_clothing_index_path)
	end

	private 

		def possible_matches_params	
			params.require(PossibleMatch).permit(:contemplated_piece, :suggested_piece)
		end

end

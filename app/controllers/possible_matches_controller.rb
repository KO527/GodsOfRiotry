class PossibleMatchesController < ApplicationController
	before_action :contemplated_piece, only: [:new, :index, :edit, :destroy]
	before_action :admin, only: [:new, :create, :edit, :destroy]
	before_action :possible_matches, only: [:create, :edit]
	respond_to :js, :html

	layout 'final_preparation', only: [:new, :edit]


	def new
		@gor_clothings = Gor_Clothing.where.not(:gor_clothing => :contemplated_piece) #except contemplated_piece
		@possible_match.build
		<%= render :partial => 'eval', :collection => @gor_clothings %>
	end

	def create
		@possible_match.update_attributes(possible_matches_params)
		flash[:notice] = "Possible matches for this gor_clothing piece created" if @possible_matches.save
	end

	def show
		PossibleMatch.find(:all)
	end

	def index
	end
	
	def edit
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

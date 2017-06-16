class PossibleMatchesController < ApplicationController
	before_action :admin, only: [:new, :create, :edit, :destroy]
	respond_to :js, :html

	layout 'final_preparation', only: [:new, :edit]
	layout 'main_display', only: [:show]

	attr_accessor :visible_gor_clothing

	def new
		@gor_clothings = Gor_Clothing.all
		@possible_match = PossibleMatch.new(contemplated_piece_id: params[:gor_clothing_id])
	end

	def create 
		@possible_match = PossibleMatch.create(possible_matches_params)
		flash[:notice] = "Possible matches for this gor_clothing piece created" if @possible_matches.save
	end

	def show
		if current_user.gender == :male #We need to specify merch_type: :top for Gor_Clothing and merch_type? for PossibleMatches
			@contemplated_piece = self.fetch((params[:visible_gor_clothing][:contemplated_piece_id]), Gor_Clothing.order(gender: :male, created_at: :desc).first)
		elsif current_user.gender == :female
			@contemplated_piece = self.fetch((params[:visible_gor_clothing][:suggested_piece_id]), Gor_Clothing.order(gender: :female, created_at: :desc).first)
		end
		@possible_matches = PossibleMatch.where('contemplated_piece_id = ?', @contemplated_piece.id)
		@suggested_pieces = @possible_matches.suggested_pieces.order(created_at: :desc)
		@possible_match_suggested_tops = Gor_Clothing.where('merch_type = ?', top).where('toggled_pieces.contemplated_piece_id = ?', @contemplated_piece.id).order(created_at: :desc)
		@possible_match_suggested_bottoms = Gor_Clothing.where('merch_type = ?', bottom).where('toggled_pieces.contemplated_piece_id = ?', @contemplated_piece.id).order(created_at: :desc)
		@possible_match_extra_tops = Gor_Clothing.where('merch_type = ?', top).where.not('toggled_pieces.contemplated_piece_id = ?', @contemplated_piece.id).order(created_at: :desc)
		@possible_match_extra_bottoms = Gor_Clothing.where('merch_type = ?', bottom).where.not('toggled_pieces.contemplated_piece_id = ?', @contemplated_piece.id).order(created_at: :desc)

		respond_to do |format|
			format.js
		end	
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

	#needs to somehow be retrieved through javascript at the end of toggling after elapsed time
	
	#Available to Wardrobes controller as well.
	def possible_match_outfit
	end
	
	protected

		def visible_gor_clothing
			@visible_gor_clothing = Struct.new(:contemplated_piece_id, :suggested_piece_id)
		end
	end

	private

		def possible_matches_params	
			params.require(PossibleMatch).permit(:contemplated_piece_id, :suggested_piece_id)
		end
	end

end

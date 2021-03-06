class WardrobesController < VisibleGorClothingController
	respond_to :html, :js

	layout 'main_display'

	# def index 
	# 	@gor_clothings = Gor_clothing.all
	# 	@past_wardrobes = current_user.wardrobes.all
	# 	@past_wardrobes.each do |past_wardrobe| 
	# 		past_wardrobe.gor_clothings.each do |clothing_piece|
	# 			if @gor_clothings.include?(clothing_piece) && @gor_clothing.clothing_piece.count < 5
	# 				@how_many_left = gor_clothing.clothing_piece.count
	# 			elsif @gor_clothings.include?(clothing_piece) && @gor_clothing.clothing_piece.count > 5
	# 				@how_many_left = {}
	# 			elsif @gor_clothings.exclude?(clothing_piece)
	# 				@how_many_left = "none exist"
	# 			else
	# 				next
	# 			end
	# 		end
	# 	end
	# end

	def new
	end

	def show

	end

	def create
	end

	def update
		# Setup cookies for Wardrobe model
			if current_user.wardrobes.find(:all).include?(@visible_gor_clothing)			
				flash.now[:notice] = "You already have this match in the wardrobe."
				respond_to do |format|
					format.html {render :show}
					format.js
				end
			elsif both_pieces_present?
				@new_patch = PossibleMatch.find(params[:visible_gor_clothing])
				respond_to do |format|
				     format.html{ render :show}
				     format.js
				end
			else
			 	@new_patch = PossibleMatch.fetch(both_pieces, :contemplated_piece_id)			 	
			 	respond_to do |format|
			 		format.html{ render :show}
			 		format.js
				end
			end		
	end

	private
		def both_pieces_present?
			PossibleMatch.exists?(:contemplated_piece_id => @visible_gor_clothing.contemplated_piece_id, :suggested_piece_id => @visible_gor_clothing.suggested_piece_id)
		end

		def both_pieces
			if both_pieces_present?
				Struct.new(:contemplated_piece_id, :suggested_piece_id)
			end
		end

		def wardrobe_params
			params.require(:wardrobe).permit(possible_match_attributes: [:contemplated_piece_id, :suggested_piece_id, images_attributes: [:picture, :_destroy]])
		end

end
class PossibleMatchesController < VisibleGorClothingController
	before_action :admin, only: [:new, :create, :edit, :destroy]
	respond_to :js, :html

	before_action :setup_possible_matches, only: [:show, :organize_piecesz]
	

	def new
		@gor_clothings = Gor_Clothing.all
		@possible_match = PossibleMatch.new(contemplated_piece_id: params[:gor_clothing_id])
	end

	def create 
		@possible_match = PossibleMatch.create(possible_matches_params)
		flash[:notice] = "Possible matches for this gor_clothing piece created" if @possible_matches.save
	end

	def show

		respond_to do |format|
			format.html {}
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
	
	private
	
		def setup_possible_matches
			
			 if current_user.gender == :male #We need to specify merch_type: :top for Gor_Clothing and merch_type? for PossibleMatches
                       		@contemplated_piece = self.fetch(params[:visible_gor_clothing][:contemplated_piece_id], Gor_Clothing.order(gender: :male, created_at: :desc).first)
                       		@standalone_bottoms = Gor_Clothing.where('standalone = ?', true).where('merch_type = ?', bottom).order(gender: :male, created_at: :desc)
                        	@standalone_tops = Gor_Clothing.where('standalone = ?', true).where('merch_type = ?', top).order(gender: :male, created_at: :desc)
                        	@suggested_tops = Gor_Clothing.where('merch_type = ?', top).where('toggled_pieces.contemplated_piece_id = ?', @contemplated_piece.id).order(gender: :male, created_at: :desc)
                       		@suggested_bottoms = Gor_Clothing.where('merch_type = ?', bottom).where('toggled_pieces.contemplated_piece = ?', @contemplated_piece.id).order(gender: :male, created_at: :desc)
                        	@extra_tops = Gor_Clothing.where('merch_type = ?', top).where.not('toggled_pieces.contemplated_piece_id = ?', @contemplated_piece.id).where('standalone = ?', false).order(created_at: :desc)
                        	@extra_bottoms = Gor_Clothing.where('merch_type = ?', bottom).where.not('toggled_pieces.contemplated_piece_id = ?', @contemplated_piece.id).where('standalone = ?', false).order(created_at: :desc)
                	elsif current_user.gender == :female
                        	@contemplated_piece = self.fetch(params[:visible_gor_clothing][:contemplated_piece_id], Gor_Clothing.order(gender: :female, created_at: :desc).first)
                        	@standalone_tops = Gor_Clothing.where('standalone = ?', true).where('merch_type = ?', top).order(gender: :female, created_at: :desc)
                                @standalone_bottoms = Gor_Clothing.where('standalone = ?', true).where('merch_type = ?', bottom).order(gender: :female, created_at: :desc)
                        	@suggested_tops = Gor_Clothing.where('merch_type = ?', top).where('toggled_pieces.contemplated_piece_id = ?', @contemplated_piece.id).order(gender: :female, created_at: :desc)
                        	@suggested_bottoms = Gor_Clothing.where('merch_type = ?', bottom).where('toggled_pieces.contemplated_piece_id = ?', @contemplated_piece.id).order(gender: :female, created_at: :desc)
                        	@extra_tops = Gor_Clothing.where('merch_type = ?', top).where.not('toggled_pieces.contemplated_piece_id = ?', @contemplated_piece.id).where('standalone = ?', false).order(created_at: :desc)
                        	@extra_bottoms = Gor_Clothing.where('merch_type = ?', bottom).where.not('toggled_pieces.contemplated_piece_id = ?', @contemplated_piece.id).where('standalone = ?', false).order(created_at: :desc)
                	end
	
		end	
	
		def addtoArray(arraylist, declaredArray)
                    for i in arraylist.length - 1
                        declaredArray += arraylist[i]
                    end
                end
			
		def organize_pieces
		         LowerComponents = new Array
			 UpperComponents = new Array
		if (@contemplated_piece.merch_type == 'bottom')
                        addToArray(@contemplated_piece, LowerComponents);
                        addToArray(@extra_bottoms, LowerComponents);
                        addToArray(@standalone_bottoms, LowerComponents);
                        addToArray(@suggested_tops, UpperComponents);
                        addToArray(@extra_tops, UpperComponents);
                        addToArray(@standalone_tops, UpperComponents);
                        return [LowerComponents, UpperComponents];
                else if (@contemplated_piece.merch_type == 'top')
                        addToArray(@contemplated_piece, UpperComponents);
                        addToArray(@extra_tops, UpperComponents);
                        addToArray(@standalone_tops, UpperComponents);
                        addToArray(@suggested_bottoms, LowerComponents);
                        addToArray(@extra_bottoms, LowerComponents);
                        addToArray(@standalone_bottoms, LowerComponents);
                        return [UpperComponents, LowerComponents];
		else 
			return;
	        end
		
		def possible_matches_params	
			params.require(PossibleMatch).permit(:contemplated_piece_id, :suggested_piece_id, :gor_clothing_id, images_attributes: [:picture])
		end

end

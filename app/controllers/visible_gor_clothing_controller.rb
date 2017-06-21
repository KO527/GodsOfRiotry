class VisibleGorClothingController < ApplicationController

	attr_accessor :visible_gor_clothing

	protected

		def detail
			respond_with(@gor_clothing)
		end

		def visible_gor_clothing	
			@visible_gor_clothing = Struct.new(:contemplated_piece_id, :suggested_piece_id)
		end
	end


end

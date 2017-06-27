class VisibleGorClothingController < ApplicationController

	attr_accessor :visible_gor_clothing

	protected

		def detail
			respond_with(@gor_clothing)
		end

		def visible_gor_clothing	
			@visible_gor_clothing = Struct.new(args[:contemplated_piece_id] || nil, args[:suggested_piece_id] || nil) #or nil for both params
		end
	end


end

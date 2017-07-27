class VisibleGorClothingController < ApplicationController

	attr_accessor :visible_gor_clothing

	protected

		def detail
			respond_with(@gor_clothing)
		end

		def visible_gor_clothing	
			@visible_gor_clothing = Struct.new(@contemplated_piece = args.fetch(:contemplated_piece_id, nil), @suggested_piece = args.fetch(:suggested_piece_id, nil))#or nil for both params
		end


end

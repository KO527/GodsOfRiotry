class WardrobesController < ApplicationController
	def new
		@gor_clothing = Gor_clothing.find(params[:gor_clothing_id])
		@wardrobe = current_user.wardrobe
		@wardrobe.assign_attributes(@gor_clothing)
	end

	def create
		@wardrobe.update
		if @wardrobe.save
			flash[:success] = "Latest saved"
			current_user.past_wardrobes << @wardrobe
		else
			flash[:error] = "Something went wrong"
			render 'new'
		end
	end

	def index 
		@gor_clothing = Gor_clothing.all
		@past_wardrobes = current_user.past_wardrobes
		@past_wardrobes.all.each do |past_wardrobe| 
			past_wardrobe.gor_clothing.each do |clothing_piece|
				if @gor_clothing.include?(clothing_piece) && @gor_clothing.clothing_piece.count < 5
					@how_many_left = gor_clothing.clothing_piece.count
				elsif @gor_clothing.include?(clothing_piece) && @gor_clothing.clothing_piece.count > 5
					@how_many_left = {}
				elsif @gor_clothing.exclude?(clothing_piece)
					@how_many_left = "none exist"
				else
					next
				end
			end
		end
	end


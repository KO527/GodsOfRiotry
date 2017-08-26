class Wardrobe < ActiveRecord::Base
	belongs_to :user
	has_many :gor_clothings
	validates_associated :gor_clothing
	validates_presence_of :gor_clothing
	has_many :possible_matches


	# accepts_nested_attributes_for :gor_clothing, allow_destroy: true, limit: 12, reject_if: proc {|attributes| attributes[:image][:type_of_image] != :show_picture || attributes[:image][:picture].blank?}, on: :update
	has_many :images
	validates_associated :image, conditions: -> {where (type_of_image: 'show_picture')}
end	

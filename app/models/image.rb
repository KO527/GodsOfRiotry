class Image < ActiveRecord::Base
	enum type_of_image: [:front_shot, :show_picture, :back_shot, :model_shot]

	mount_uploader :picture, PictureUploader
	
	belongs_to :gor_clothing, foreign_key: "gor_clothing_id"
	
	validates :type_of_image, presence: true
	validates :gor_clothing_id, presence: true
	validates_presence_of :picture #a show_picture 
	# errors -> show_picture, "There must be a show_picture"

	validate :picture_size
	validate :check_for_existing_image_type
	validate :show_picture_present, on: :destroy

	private

		def show_picture_present
			errors.add(:gor_clothing_name, "needs a show picture") if self.type_of_image == :show_picture
		end

		def picture_size
			if self.picture.size > 5.megabytes
        				errors.add(:picture, "should be less than 5MB")
      			end
		end

		def check_for_existing_image_type
			errors.add(:type_of_image, "A %{type_of_image} image is present already. Would you like to override?") if self.gor_clothing_id.include?(images.where(type_of_image: params[:type_of_image]))
		end


end


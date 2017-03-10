require 'test_helper'

class AdminGorClothingCreateTest < ActionDispatch::IntegrationTest
	def setup
	      @gor_clothing = gor_clothing(:flannel_shirt)
	      @images = @gor_clothing.images
	end

  test "Creating new merchandise will lead to preview html" do
  	get new_admin_gor_clothing_path
  	assert_template 'gor_clothing/new'
  	picture = fixture_file_upload('test/fixtures/flannel.png', 'image/new')
  	post new_admin_gor_clothing_path params: { gor_clothing:{name: 'new flannel shirt', 
  									description: 'The type of shirt that would excellent for a barbecue',
  									quantity: 6, 
  									gender: male, 
  									size: medium, 
  									image[:picture] => picture }}
  	assert_template 'images/preview'
  end

  test "Submitting first-time correct entry to type_of_image leads to gor_clothing show" do
  	get edit_admin_gor_clothing_path
  	assert_template 'gor_clothing/edit'
  	picture = fixture_file_upload('test/fixtures/flannel_show_picture_shot')
  	post edit_admin_gor_clothing_path params: {gor_clothing: {image[:picture] => picture}}
  	assert_template 'images/preview'
  	post admin_image_path params:{gor_clothing: {image[:type_of_image] => 'show_picture'}}
  	assert_template 'gor_clothing/show'
  	assert_match image_tag @gor_clothing.image.show_picture, response_body
  end

  test "Submitting pre-existing type_of_image entry leads to display of errors" do
  	get edit_admin_gor_clothing_path
  	assert_template 'gor_clothing/edit'
  	picture = fixture_file_upload('test/fixtures/flannel_show_picture_shot')
  	post edit_admin_gor_clothing_path params: {gor_clothing: {image[:picture] => picture}}
  	assert_template 'images/preview'
  	post admin_image_path params:{gor_clothing: {image[:type_of_image] => 'show_picture'}}
  	assert_template 'gor_clothing/show'
  	get edit_admin_gor_clothing_path
  	assert_template 'gor_clothing/edit'
  	picture = fixture_file_upload('test/fixtures/flannel_model_shot')
  	post edit_admin_gor_clothing_path params: {gor_clothing: {image[:picture] => picture}}
  	assert_template 'images/preview'
  	post admin_image_path params: {gor_clothing: {image[:type_of_image] => 'show_picture'}}
  	assert_match @images.errors, response.body
  end
end

require 'test_helper'

class AdminGorClothingCreateTest < ActionDispatch::IntegrationTest
  def setup
	# @gor_clothing = gor_clothing.all
	# @images = @gor_clothing.images
	@gor_clothing = gor_clothings(:flannel_shirt)
	@green_shorts = gor_clothings(:green_shorts)
	@black_leather_pants = gor_clothings(:black_leather_skinnys)
	@user = users(:administrator)
	@phillip = users(:phillip)
  end

  #uploading new images will lead to preview html

  # test "Creating new merchandise will lead to preview html" do
  # 	get new_admin_gor_clothing_path
  # 	assert_template 'gor_clothing/new'
  # 	picture = fixture_file_upload('test/fixtures/flannel.png', 'image/new')
  # 	post admin_gor_clothing_index_path params: {gor_clothing:{name: 'new flannel shirt', 
  # 									description: 'The type of shirt that would be excellent for a barbecue',
  # 									quantity: 6, 
  # 									gender: male, 
  # 									size: medium, 
  # 									image[:picture] => picture }}
  # 	assert_template 'images/preview'
  # end


  test "verifies uploading new piece for first time should lead to preview html and then to possible matches template and subsequently to gor_clothing/show where show_picture type_of_image is present" do
   	log_in_as(@user)
   	get new_admin_gor_clothing_path
   	assert_template 'admin/gor_clothing/new'
   	picture = fixture_file_upload('test/fixtures/flannel_show_picture_shot')
	post admin_gor_clothing_index_path, params: {gor_clothing:{name: 'new flannel shirt', 
  									  description: 'The type of shirt that would be excellent for a barbecue',
  									  quantity: 6, 
  									  gender: male, 
  									  size: medium, 
  									  image[:picture] => picture }}   	
  	assert_equal "text/javascript", @response.body
  	assert_template 'images/preview'
   	post admin_image_path, params: {gor_clothing: {image[:type_of_image] => 'show_picture'}}
  	assert_equal "text/javascript", @response.body
   	assert_template 'possible_matches/new'
   	assert @green_shorts.picture?
   	assert @black_leather_pants.picture?
   	post admin_possible_matches_index_path, params: {possible_matches: {suggested_piece_ids: gor_clothing_path(@green_shorts, @black_leather_pants)}}
   	assert_template "text/javascript", @response.body
   	assert_template 'gor_clothing/show'
   	#On gor_clothing/show, we should be able to see 
   	assert_match @gor_clothing.image.show_picture, response.body
   	assert_match @green_shorts.image.show_picture, response.body
   	assert_match @black_leather_pants.image.show_picture, response.body
   	@gor_clothing.suggested_pieces.each do |suggested_piece|
   		assert_select 'a[href=?]', gor_clothing_path(suggested_piece), @gor_clothing.suggested_piece.picture
   	end
  end


  test "Submitting pre-existing type_of_image entry leads to display of errors" do
  	log_in_as(@user)
  	get new_admin_gor_clothing_path
  	assert_template 'admin/gor_clothing/new'
  	picture = fixture_file_upload('test/fixtures/flannel_show_picture_shot')
  	post gor_clothing_path(@gor_clothing), params: {gor_clothing: {name: 'new flannel shirt', 
  							       		      description: 'The type of shirt that would be excellent for a barbecue',
  							                          quantity: 6,
  							      		      gender: :male, 
  						                                    size: :medium, 
  							                          image[:picture] => picture}}  
  	assert_equal "text/javascript", @response.content_type
  	assert_template 'images/preview'
  	post admin_image_path, gor_clothing: {image[:type_of_image] => 'show_picture'}
  	assert_template 'gor_clothing/show'
  	get edit_admin_gor_clothing_path, xhr: true
  	assert_equal "text/javascript", @response.content_type
  	assert_template 'gor_clothing/edit'
  	picture = fixture_file_upload('test/fixtures/flannel_model_shot')
  	patch gor_clothing_path(@gor_clothing), gor_clothing: {image[:picture] => picture}
  	assert_template 'images/preview'
  	assert_equal 'text/javascript', @response.content_type
  	post admin_image_path, gor_clothing: {image[:type_of_image] => 'show_picture'}
  	assert_template 'gor_clothing/edit'
  	assert_match @images.object.errors, response.body
  end

  test "should verify that there is an new_piece option for detail page" do
	log_in_as(@user)
	get detail_admin_gor_clothing_path(@gor_clothing)
	assert_template 'admin/gor_clothing/detail'
	assert_select 'a[href=]', new_admin_gor_clothing_path, 1
  end

  test "should verify that add new piece option should produce new form for gor_clothing" do
  	log_in_as(@user)
  	get detail_admin_gor_clothing_path(@gor_clothing)
  	assert_template 'admin/gor_clothing/detail'
  	assert_response :success
  	assert_select "a[href=?]", new_admin_gor_clothing_path, 1, text: 'Create new'
  	get new_admin_gor_clothing_path
  	assert_template 'admin/gor_clothing/new'
  end

  test "should verify that there is a destroy link for possible_matches on edit and no destroy_link when finished with editing" do
  	log_in_as(@user)
  	get detail_admin_gor_clothing_path(@gor_clothing)
  	assert_template 'admin/gor_clothing/detail'
  	assert_response :success
  	assert_select 'a', text: 'delete', count: 1
  	assert_select 'a', text: 'edit', count: 3
  	get possible_matches_admin_gor_clothing_path(@gor_clothing), xhr: true
  	assert_equal "text/javascript", @response.content_type
  	assert_select "div.possible_match" do
<<<<<<< HEAD
  		assert_select "span#possible_match_ + %{suggested_piece_id}", @gor_clothing.possible_matches.count
=======
  		assert_select "span#possible_match_suggested_piece_id", @gor_clothing.possible_matches.count
>>>>>>> b055bd417b045bbf852127ff7ae031bc6124fc45
  		assert_select "i.icon-destroy-link", @gor_clothing.possible_matches.count
  	end
  	assert_select "a[href=?]", admin_possible_matches, text: 'Finished Updating', count: 1
  	#Seed database with clothes and assert there is a difference with gor_clothing.count once we've followed through with updating
  end

  test "should verify that there is an edit form for gor_clothing after following edit option" do
  	log_in_as(@user)
  	assigns(:gor_clothing)	= @gor_clothing
  	get edit_admin_gor_clothing_path(@gor_clothing), xhr: true
  	assert_equal 'text/javascript', @response.content_type
  	assert_template 'admin/gor_clothing/edit'
<<<<<<< HEAD
  	assert_equal 'text/javascript', @response.content_type
=======
>>>>>>> b055bd417b045bbf852127ff7ae031bc6124fc45
  	assert_select("form[action=? AND method=?]", admin_gor_clothing_path, patch) do
  		assert_select "input[name *= gor_clothing[name]][value *= gor_clothing['name']]"
  		assert_select "textarea[name *= gor_clothing[description]][value *= gor_clothing['description']]"
  		assert_select "input[name *= gor_clothing[quantity]][value *= gor_clothing['quantity']]"
  		assert_select "select[name *= gor_clothing[gender]][value *= male][value *= female][value *= androgynous]"
  		assert_select "select[name *= gor_clothing[size]][value *= S][value *= M][value *= L]"
<<<<<<< HEAD
  		assert_select "select[file_field *= gor_clothing[image][picture]]"
  	end
  end

  test "should verify that there are destroy links on images after clicking on edit" do
   	log_in_as(@user)
   	assigns(:gor_clothing) = @gor_clothing
   	get edit_some_admin_images_path(@gor_clothing), xhr: true
   	assert_template 'admin/gor_clothing/%{@gor_clothing.id}/images/edit_some'
   	assert_equal 'text/javascript', @response.content_type
=======
  	end
  	assert_select 
  end

  test "should verify that there are destroy links on images after clicking on edit" do

>>>>>>> b055bd417b045bbf852127ff7ae031bc6124fc45
  end

end

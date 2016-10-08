require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "root_path leads to home page" do
       get "/gor_main"
       assert_response :success
       assert_template partial: 'songs/_songs'       
       assert_template partial: 'gor_clothing/_show'
       assert_template partial: 'event_tickets/_event_tickets'
  end
 
end


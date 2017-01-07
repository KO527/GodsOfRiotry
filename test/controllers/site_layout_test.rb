require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "show leads to user profile and contains" do

       def setup
             @user = users(:michael) 
       end
    
       get "/users/show"
       assert_template 'users/show'
       assert_template partial: 'songs/_songs'       
       assert_template partial: 'gor_clothing/_show'
       assert_template partial: 'event_tickets/_event_tickets'
  end
 
end


require 'spec_helper'

describe "Users" do
  describe "GET /users" do
    it "user forms require all fields" do
      visit users_path
      click_link "New User"
      fill_in "Name", with: "Chris Chike"
      click_button "Create User"
      
      error_message = "Email can't be blank"
      page.should have_content(error_message)
    end
  end
  
 
end

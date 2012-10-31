require 'spec_helper'

describe "Users" do
  before do 
    sign_in
  end
  describe "GET /users" do
    it "user forms require all fields" do
      visit users_path
      click_link "New User"
      click_button "Create User"
      
      error_message = "Email can't be blank"
      page.should have_content(error_message)
    end
  end
  
 
end

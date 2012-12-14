require 'spec_helper'

describe "Users" do
  before do 
    sign_in
  end
  
  describe "POST /orders" do
    it "order forms require all fields" do
      visit orders_path
      click_link "New Order"
      click_button "Create Order"
      
      error_message = "Email can't be blank"
      page.should have_content(error_message)
    end
  end
  
 
end

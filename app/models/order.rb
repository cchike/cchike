
 # --1. Make user account for each agent (rails admin, video from email--check around 45min)
 # 2. Find a way to update local database directly from Vago database (gem sequel, gem httparty if http api)
 # --3. Enable agents to set ownership of any order
 # --4. Enable agents to filter orders by ownership
 # --5. Add a field for the customer who put in the order (first name, last name, email)
 # --6. Send email notification to customer when the order is outgoing (http://edgeguides.rubyonrails.org/active_model_basics.html)
 # --7. Add 'Ready For Pickup' status; send email notification to the owner if the order is claimed
 # --8. Add a field for what vendor the order came from
 # --9. Be able to handle multiple orders from one customer
 # --10. Make sure vendors can only see orders which belong to them (devise vendor)
 # --11. Consider global authentication (check email, put in application controller)


class Order < ActiveRecord::Base
  scope :descending_id, order('id desc')
  
  belongs_to :user
  attr_accessible :contents, :id, :address, :customer_name, :customer_email, :vendor, :status, :ordertype, :user_id, :ready_for_pickup
  validates :customer_email, format: { :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, :message => "must be a valid email address"}
  
  def self.importFromVago(id)
    
  end
end

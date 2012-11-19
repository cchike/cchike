/
 1. Make user account for each agent
 2. Find a way to update local database directly from Vago database
 3. Enable agents to set ownership of any order
 4. Enable agents to filter orders by ownership
 5. Add a field for the customer who put in the order (first name, last name, email)
 6. Send email notification to customer when the order is outgoing
 7. Add 'Ready For Pickup' status; send email notification to the owner if the order is claimed
 8. Add a field for what vendor the order came from
 9. Be able to handle multiple orders from one customer
 10. Make sure vendors can only see orders which belong to them
 11. Consider global authentication
/

class Order < ActiveRecord::Base
  scope :descending_id, order('id desc')
  belongs_to :user
  attr_accessible :contents, :id, :location, :name, :status, :ordertype, :user_id
end

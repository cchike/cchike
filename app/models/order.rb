class Order < ActiveRecord::Base
  scope :incoming, where('status = ?', 'Incoming')
  belongs_to :user
  attr_accessible :contents, :id, :location, :name, :status, :ordertype, :user_id
end

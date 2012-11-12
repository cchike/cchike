class Order < ActiveRecord::Base
  scope :descending_id, order('id desc')
  belongs_to :user
  attr_accessible :contents, :id, :location, :name, :status, :ordertype, :user_id
end

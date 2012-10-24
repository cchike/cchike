class Order < ActiveRecord::Base
  belongs_to :user
  attr_accessible :contents, :id, :location, :name, :status, :type, :user_id
end

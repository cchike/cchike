class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable 
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable #, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :vendor, :admin
  validates :email, presence: true, format: { :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, :message => "must be a valid email address"}
  
  def admin?
    admin == true
  end
  
  def vendor?
    vendor == true
  end
  
end

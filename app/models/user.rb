class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  validates :password, 
            :presence => { :on => :create },
            :length   => { :minimum => 6, :allow_blank => true },
            :confirmation => true

  validates :password_confirmation, :presence => true, :if => '!password.blank?'

  validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_presence_of   :email
end

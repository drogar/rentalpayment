class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :assignments
  has_many :roles, :through => :assignments

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def authorized_for?(action, resource)
    roles.includes(:rights).for(action, resource).any? or roles.any? {|rl| rl.admin?}
  end
  
  def in_role?(rolename)
    roles.any? {|rl| rl.admin? or rl.role_name == rolename}
  end
end

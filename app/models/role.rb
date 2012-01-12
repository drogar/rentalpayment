class Role < ActiveRecord::Base
  
  has_many :grants
  has_many :assignments
  has_many :users, :through => :assignments
  has_many :rights, :through => :grants
  validates :role_name, :description,  presence: true
  
  
  scope :for, lambda { |action, resource|
    where("rights.operation = ? AND rights.resource = ?",
    Right::OPERATIONS_MAPPINGS[action],resource) }
  
  def admin?
    role_name == 'Administrator'
  end
  
end

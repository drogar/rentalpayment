class Right < ActiveRecord::Base
  has_many :grants
  has_many :roles, :through => :grants
  
  
  OPERATIONS_MAPPINGS = {
    "new" => "CREATE",
    "create" => "CREATE",
    "edit" => "UPDATE",
    "update" => "UPDATE",
    "destroy" => "DELETE",
    "show" => "READ",
    "index" => "READ",
  }
  
  validates :resource, :operation, presence: true
  
  validates :operation, inclusion: OPERATIONS_MAPPINGS.values

end

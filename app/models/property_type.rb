class PropertyType < ActiveRecord::Base
  
  validates :property_type, :description, presence: true
  
  validates :display_order, numericality: {greater_than_or_equal_to: 1}
  
  has_many :properties
  
end

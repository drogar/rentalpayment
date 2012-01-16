class Property < ActiveRecord::Base
  belongs_to :person
  belongs_to :property_type
end

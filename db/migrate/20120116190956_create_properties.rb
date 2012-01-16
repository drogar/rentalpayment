class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :property_name
      t.text :description
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :province_or_state
      t.string :country
      t.string :postal_code
      t.integer :number_of_units
      t.integer :person_id
      t.integer :property_type_id
      
      t.timestamps
    end
  end
end

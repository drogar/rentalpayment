class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :salutation
      t.string :apartment_number
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :province_or_state
      t.string :country
      t.string :postal_code

      t.timestamps
    end
  end
end

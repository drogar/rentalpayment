class CreateLeases < ActiveRecord::Migration
  def change
    create_table :leases do |t|
      t.integer :property_id
      t.integer :person_id
      t.date :lease_start
      t.date :lease_end
      t.string :renewal_terms
      t.decimal :payment_amount, precision: 10, scale: 2
      t.string :payment_frequency
      t.string :payment_due_on
      t.integer :damage_deposit_id
      t.string :status

      t.timestamps
    end
  end
end

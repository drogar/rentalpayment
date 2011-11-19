class CreatePropertyTypes < ActiveRecord::Migration
  def change
    create_table :property_types do |t|
      t.string :property_type
      t.string :description
      t.integer :display_order

      t.timestamps
    end
  end
end

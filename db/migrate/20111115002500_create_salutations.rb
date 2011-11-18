class CreateSalutations < ActiveRecord::Migration
  def change
    create_table :salutations do |t|
      t.string :salutation
      t.string :language
      t.integer :display_order

      t.timestamps
    end
  end
end

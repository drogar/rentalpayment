class CreateAssignments < ActiveRecord::Migration
  def up
    drop_table :roles_users
    create_table :assignments do |t|
      t.integer :user_id
      t.integer :role_id

      t.timestamps
    end
  end
  def down
    drop_table :assignments
    create_table :roles_users, :id => false do |t|
      t.integer :role_id
      t.integer :user_id

      t.timestamps
    end
  end
end

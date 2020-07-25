class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :address
      t.string :email, null: false
      t.integer :role_id, null: false
      t.boolean :terms_agreed, null: false

      t.timestamps
    end
  end
end

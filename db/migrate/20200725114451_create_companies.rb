class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :address
      t.string :title
      t.integer :owner_id
      t.string :address

      t.timestamps
    end
  end
end

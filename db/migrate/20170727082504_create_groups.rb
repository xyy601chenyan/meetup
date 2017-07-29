class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.integer :user_id
      t.string :city
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end

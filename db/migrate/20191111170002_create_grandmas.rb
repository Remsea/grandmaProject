class CreateGrandmas < ActiveRecord::Migration[5.2]
  def change
    create_table :grandmas do |t|
      t.string :name
      t.text :description
      t.float :lng
      t.float :lat
      t.references :user, foreign_key: true
      t.float :price
      t.text :address
      t.integer :age
      t.string :photo
      t.string :competence
      t.timestamps
    end
  end
end

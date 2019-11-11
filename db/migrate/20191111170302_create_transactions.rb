class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :grandma, foreign_key: true
      t.references :user, foreign_key: true
      t.date :rentalDate

      t.timestamps
    end
  end
end

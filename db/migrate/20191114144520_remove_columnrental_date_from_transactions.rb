class RemoveColumnrentalDateFromTransactions < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :rentalDate
    add_column :transactions, :rentaldate, :date
  end
end

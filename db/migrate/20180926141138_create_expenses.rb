class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :category
      t.float :amount
      t.datetime :date

      t.timestamps
    end
  end
end

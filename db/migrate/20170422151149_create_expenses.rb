class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :title
      t.text :description
      t.integer :amount
      t.integer :start_month
      t.integer :interval
      t.boolean :active

      t.timestamps
    end
  end
end

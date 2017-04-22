class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.boolean :paid
      t.belongs_to :expense
      t.belongs_to :month

      t.timestamps
    end
  end
end

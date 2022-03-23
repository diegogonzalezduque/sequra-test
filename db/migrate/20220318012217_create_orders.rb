class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.float :amount
      t.datetime :completed_at
      t.integer :shoper_id
      
      t.timestamps
    end
  end
end

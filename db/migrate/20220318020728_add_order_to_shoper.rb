class AddOrderToShoper < ActiveRecord::Migration[7.0]
  def change
    add_reference :shopers, :order, null: false, foreign_key: true
  end
end

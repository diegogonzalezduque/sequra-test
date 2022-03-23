class AddOrderToWeeklyDisbursment < ActiveRecord::Migration[7.0]
  def change
    add_reference :Weekly_disbursements ,:orders , null: true, foreign_key: true
  end
end

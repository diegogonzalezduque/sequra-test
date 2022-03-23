class CreateWeeklyDisbursements < ActiveRecord::Migration[7.0]
  def change
    create_table :weekly_disbursements do |t|
      t.float :amount
      t.float :sequra_fee

      t.timestamps
    end
  end
end

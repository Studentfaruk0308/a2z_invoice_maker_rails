class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.string :inv_number
      t.date :date_of_issue
      t.date :due_date
      t.string :job_reference
      t.string :description
      t.float :quantity
      t.float :unit_price
      t.float :tax
      t.float :paid_amount
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end

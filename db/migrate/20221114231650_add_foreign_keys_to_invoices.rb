class AddForeignKeysToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :profile_id, :string
  end
end

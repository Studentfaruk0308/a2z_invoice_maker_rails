class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :company_name
      t.string :contact_person_name
      t.string :email
      t.string :mobile_number
      t.string :phone_number
      t.string :postal_address

      t.timestamps
    end
  end
end

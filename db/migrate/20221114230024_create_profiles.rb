class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles, id: :string do |t|
      t.string :profile_name
      t.string :company_name
      t.string :address
      t.string :abn
      t.string :email
      t.string :contact_number
      t.string :bank_details

      t.timestamps
    end
  end
end

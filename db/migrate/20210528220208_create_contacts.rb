class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone_number
      t.string :email
      t.boolean :email_confirmation, default: false

      t.timestamps
    end
  end
end

class AddEmailConfirmTokenToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :confirm_token, :string
  end
end

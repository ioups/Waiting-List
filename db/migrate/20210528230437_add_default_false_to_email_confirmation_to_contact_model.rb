class AddDefaultFalseToEmailConfirmationToContactModel < ActiveRecord::Migration[6.1]
  def change
    change_column :contacts, :email_confirmation, :boolean, default: false
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end

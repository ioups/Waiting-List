class AddValidationDateTimeAndRenewedDateTimeOnContactModel < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :validated_on, :datetime
    add_column :contacts, :renewed_on, :datetime
  end
end

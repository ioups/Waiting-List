class Contact < ApplicationRecord
    validates_presence_of :firstname, :lastname, :phone_number, :email, 
    validates_length_of :first_name, :last_name, minimum: 2, maximum: 40
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end

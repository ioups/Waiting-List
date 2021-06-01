class Contact < ApplicationRecord


    validates_presence_of :firstname, :lastname, :phone_number, :email 
    validates_length_of :firstname, :lastname, minimum: 2, maximum: 40
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP

    def confirmed!
        email_confirmation = true
        
    end
    def validated_on!
        validated_on = DateTime.now
    end
    
    
    def renew!
        renewed_on = DateTime.now
    end
    
end


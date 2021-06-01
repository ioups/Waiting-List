class Contact < ApplicationRecord

    validates_presence_of :firstname, :lastname, :phone_number, :email 
    validates_length_of :firstname, :lastname, minimum: 2, maximum: 40
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP

    before_create :confirmation_token


    def confirmed!
        email_confirmation = true
        confirm_token = nil
        save!
        
    end
    def validated_on!
        validated_on = DateTime.now
        save!
    end
    
    
    def renew!
        renewed_on = DateTime.now
        save!
    end
   
    private
   
   def confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
   end


end


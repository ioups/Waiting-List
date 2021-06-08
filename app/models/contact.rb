class Contact < ApplicationRecord

    validates_presence_of :firstname, :lastname, :phone_number, :email 
    validates_length_of :firstname, :lastname, minimum: 2, maximum: 40
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
    validates_uniqueness_of :email, :phone_number

    before_create :confirmation_token


    def confirmed!
        self.email_confirmation = true
        save!
        
    end

    def optout!
        self.email_confirmation = false
        self.renewed_on = nil
        save!
        
    end

    def validated_on!
        self.validated_on = DateTime.now
        save!
    end
    
    
    def renew!
        self.renewed_on = DateTime.now
        save!
    end
   
    private
   
   def confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
   end


end


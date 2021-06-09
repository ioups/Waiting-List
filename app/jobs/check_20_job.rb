class Check20Job < ApplicationJob
  queue_as :default

  def perform(contact_id)
    contact = Contact.find(contact_id)
    puts "contact found"
    if contact.renewed_on
      if (DateTime.now.to_i - contact.renewed_on.to_i) / 60 >= 1
        contact.optout!
        "puts contact renewed output"
        ContactMailer.optout(contact).deliver_later
        "puts contact renewed mail sent"
      end
    elsif contact.email_confirmation == true
      if (DateTime.now.to_i - contact.validated_on.to_i) / 60 >= 1 
        contact.optout!
        "puts contact confirmed output"
        ContactMailer.optout(contact).deliver_later
        "puts contact renewed mail sent"
      end
    end
  end
end

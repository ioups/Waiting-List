class Check20Job < ApplicationJob
  queue_as :default

  def perform(contact_id)
    contact = Contact.find(contact_id)
    if contact.renewed_on
      if (DateTime.now.to_i - contact.renewed_on.to_i) / 86400 >= 20
        contact.optout!
      end
    elsif (DateTime.now.to_i - contact.validated_on.to_i) / 86400 >= 20 
      contact.optout!
    else
      puts "not now"
    end
  end
end

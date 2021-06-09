class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.welcome.subject
  #
  def welcome(contact)
    @contact = contact

    mail( 
      to: @contact.email, 
      subject: "Votre inscription sur la liste d'attente de Brest-Coworking",
      from: 'pierre@brest-coworking.xyz',
      track_opens: 'true',
      message_stream: 'outbound')
  end

  def renew(contact)
    @contact = contact

    mail( 
      to: @contact.email, 
      subject: "Brest-Coworking : confirmez votre position dans la liste d'attente",
      from: 'pierre@brest-coworking.xyz',
      track_opens: 'true',
      message_stream: 'outbound')
  end

  def optout(contact)
    @contact = contact

    mail( 
      to: @contact.email, 
      subject: "Brest-Coworking : votre inscription sur la liste d'attente est annulée",
      from: 'pierre@brest-coworking.xyz',
      track_opens: 'true',
      message_stream: 'outbound')
  end

  def hello
    mail(
      subject: 'hello from postmark',
      to: "test@blackhole.postmarkapp.com",
      from: 'pierre@brest-coworking.xyz',
      html_body: '<strong>Hello</strong> dear Postmark user.',
      track_opens: 'true',
      message_stream: 'outbound')
  end


  

end

require "test_helper"

class ContactMailerTest < ActionMailer::TestCase
  test "welcome" do
    @contact = contacts(:contact_1)
    mail = ContactMailer.welcome(@contact)
    assert_equal "welcome to the Brest-Coworking waiting list", mail.subject
    assert_equal [@contact.email], mail.to
    assert_equal ["pierre@brest-coworking.xyz"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

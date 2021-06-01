require "test_helper"

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  test " confirmed! changes email_validation to 'true'" do
  #   assert true
  contact = Contact.new(firstname: "Pierre", lastname: "Daigre", phone_number: "+33663009349", email:"pe.daigre@gmail.com")
  assert_equal true, contact.confirmed!
    # end
  end

  test "validated_on!  add datetime to validated_on" do
    #   assert true
    contact = Contact.new(firstname: "Pierre", lastname: "Daigre", phone_number: "+33663009349", email:"pe.daigre@gmail.com")
    assert_equal DateTime.now.to_i, contact.validated_on!.to_i
      # end
    end

  test "renew!  add datetime to renewed_on" do
    #   assert true
    contact = Contact.new(firstname: "Pierre", lastname: "Daigre", phone_number: "+33663009349", email:"pe.daigre@gmail.com")
    assert_equal DateTime.now.to_i, contact.renew!.to_i
      # end
    end
end

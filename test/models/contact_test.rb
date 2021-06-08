require "test_helper"

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  test 'valid contact' do
    contact = Contact.new(firstname: "John", lastname: "Doe", email: 'john@example.com', phone_number: "123456")
    assert contact.valid?
  end

  test 'invalid without name' do
    contact = Contact.new(lastname: "Doe", email: 'john@example.com', phone_number: "123456")
    refute contact.valid?, 'contact is valid without a name'
    assert_not_nil contact.errors[:name], 'no validation error for name present'
  end

  test 'invalid without email' do
    contact = Contact.new(firstname: "John", lastname: "Doe", phone_number: "123456")
    refute contact.valid?
    assert_not_nil contact.errors[:email]
  end

  test 'invalid with already used email' do
    contact1 = Contact.new(firstname: "John", lastname: "Doe", email: 'john@example.com', phone_number: "123456")
    contact1.save
    contact2 = Contact.new(firstname: "John", lastname: "Doe", email: 'john@example.com', phone_number: "987654")
    refute contact2.valid? 'Contact is valid with an already used email'
    assert_not_nil contact2.errors[:email]
  end

  test 'invalid with already used phone_number' do
    contact1 = Contact.new(firstname: "John", lastname: "Doe", email: 'john@example.com', phone_number: "123456")
    contact1.save
    contact2 = Contact.new(firstname: "John", lastname: "Doe", email: 'doe@example.com', phone_number: "123456")
    refute contact2.valid? 'Contact is valid with an already used phone_number'
    assert_not_nil contact2.errors[:phone_number]
  end


  test "confirmed! changes email_validation to 'true'" do
    #   assert true
    contact = contacts(:contact_1)
    assert_not_empty contact.confirm_token, ["confirm token should not be nil"] 
    contact.confirmed!
    assert_equal true, contact.email_confirmation, ["email confirmation should be true"]
      # end
  end

  test "validated_on!  add datetime to validated_on" do
    #   assert true
      contact = contacts(:contact_2)
      contact.validated_on!
      assert_equal DateTime.now.to_i, contact.validated_on.to_i, ["times should be set and equal"]
        # end
    end

  test "renew!  add datetime to renewed_on" do
    #   assert true
      contact = contacts(:contact_3)
      contact.renew!
      assert_equal DateTime.now.to_i, contact.renewed_on.to_i, ["times should be set and equal"]
      # end
    end
end

require "test_helper"

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  test " confirmed! changes email_validation to 'true'" do
  #   assert true
  contact = contacts(:contact_1)
  assert_not_empty contact.confirm_token, ["confirm token should not be nil"] 
  contact.confirmed!
  assert_equal true, contact.email_confirmation, ["email confirmation should be true"]
  assert_nil contact.confirm_token, ["confirm token should be nil"]
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

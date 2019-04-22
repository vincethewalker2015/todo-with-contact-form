require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  
  def setup
    @contact = Contact.new(name: "vincent", email: "contact@vincethewalker.com", comments: "This is a Comment")
  end
    
  test "should be valid" do
    assert @contact.valid?
  end
  
  test "contact name should be present" do
    @contact.name = ""
    assert_not @contact.valid?
  end
  
  test "contact name should not more more than 30 characters" do
    @contact.name = "a" * 31
    assert_not @contact.valid?
  end
  
   test "contact email should be present" do
    @contact.email = ""
    assert_not @contact.valid?
  end
  
   test "contact email should not more more than 255 characters" do
    @contact.email = "a" * 245 + "@example.com"
    assert_not @contact.valid?
  end
  
  test "email should accept correct format" do
    valid_emails = %w[user@example.com  VINCE@gmail.com J.last@yahoo.ca john+smith@co.uk.org]
    valid_emails.each do |valids|
      @contact.email = valids
      assert @contact.valid?, "#{valids.inspect} should be valid"
    end
  end
  
  test "email should reject invalid addresses" do
    invalid_emails = %w[user@example   vinnie@gmail,com last.name@yahoo john@smith+foo.org]
    invalid_emails.each do |invalids|
      @contact.email = invalids
      assert_not @contact.valid?, "#{invalids.inspect} should be invalid"
    end
  end
  
  test "email should be unique and case insensitive" do
    duplicate_contact = @contact.dup
    duplicate_contact.email = @contact.email.upcase
    @contact.save
    assert_not duplicate_contact.valid?
  end
    
end
# frozen_string_literal: true

require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  def setup
    @contact = Contact.new(
      name: 'Guy Person',
      phone: '12345678',
      email: 'dummy@contact.com',
      message: 'Hello, I am contacting you.',
    )
  end

  test 'contact message should be valid' do
    assert @contact.valid?
  end

  # Name field tests
  test 'name must be present' do
    @contact.name = '    '
    assert_not @contact.valid?
  end

  test 'name meets 3 character minimum' do
    @contact.name = 'A'
    assert_not @contact.valid?
  end

  test 'name cannot exceed 50 character maximum' do
    @contact.name = 'a' * 51
    assert_not @contact.valid?
  end

  test 'accepts valid name' do
    @contact.name = 'Cool Fridgely'
    assert @contact.valid?
  end

  # Email field tests
  test 'email address should be present' do
    @contact.email = '      '
    assert_not @contact.valid?
  end

  test 'email address canot exceed maximum 255 character length ' do
    @contact.email = "#{'a' * 256}@email.com"
    assert_not @contact.valid?
  end

  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w[a@a DAVE@DaVe. a_Us-eR.org space-info.jp beef@cows,yum]
    invalid_addresses.each do |invalid_address|
      @contact.email = invalid_address
      assert_not @contact.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'email validation should accept valid addresses' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @contact.email = valid_address
      assert @contact.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'accepts valid email address' do
    @contact.email = 'actual@email.com'
    assert @contact.valid?
  end

  # Phone field tests
  test 'phone number must be present' do
    @contact.phone = '      '
    assert_not @contact.valid?
  end

  test 'phone number must be at least 6 numbers long' do
    @contact.phone = '1' * 5
    assert_not @contact.valid?
  end

  test 'phone number must not exceed 15 numbers long' do
    @contact.phone = '1' * 16
    assert_not @contact.valid?
  end

  test 'accepts valid phone number' do
    @contact.phone = '12345678'
    assert @contact.valid?
  end

  # Message field tests
  test 'message field must be present' do
    @contact.message = '      '
    assert_not @contact.valid?
  end

  test 'message must be at least 10 characters long' do
    @contact.message = 'a' * 9
    assert_not @contact.valid?
  end

  test 'accepts valid message' do
    @contact.message = 'a' * 25
    assert @contact.valid?
  end

end

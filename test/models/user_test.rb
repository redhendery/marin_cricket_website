# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: 'Flip', last_name: 'Flipson',
                     email: 'fridge@email.com', password: 'password',
                     password_confirmation: 'password')
  end

  # Generic User validation test against test setup
  test 'User should be valid' do
    assert @user.valid?
  end

  # User Object name field specific tests, length, validation and capitilzed
  test 'first_name must be present' do
    @user.first_name = '      '
    assert_not @user.valid?
  end

  test 'first_name is not to long' do
    @user.first_name = 'a' * 51
    assert_not @user.valid?
  end

  test 'first_name gets capitilzed' do
    @user.first_name = 'a' * 7
    assert @user.first_name = 'Aaaaaaa'
  end

  test 'last_name must be present' do
    @user.last_name = '      '
    assert_not @user.valid?
  end

  test 'last_name is not to long' do
    @user.last_name = 'a' * 51
    assert_not @user.valid?
  end

  test 'last_name gets capitilzed' do
    @user.last_name = 'a' * 7
    assert @user.last_name = 'Aaaaaaa'
  end

  # Email field specific tests, ensures present and valid
  test 'email address should be present' do
    @user.email = '      '
    assert_not @user.valid?
  end

  test 'email address is not to long' do
    @user.email = "#{'a' * 256}@email.com"
    assert_not @user.valid?
  end

  test 'email address is unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'email address is saved as lower case' do
    @user.email = 'CAPSLOCKON@EMAIL.COM'
    @user.save
    assert @user.email = 'capslockon@email.com'
  end

  test 'email validation should accept valid addresses' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'Email validation should reject invalid addresses' do
    invalid_addresses = %w[a@a DAVE@DaVe. a_Us-eR.org space-info.jp beef@cows,yum]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  # Password and Password Confirmation field specific tests for User Object
  test 'password field must be present' do
    @user.password = '      '
    assert_not @user.valid?
  end

  test 'password_confirmation field must be present' do
    @user.password_confirmation = '      '
    assert_not @user.valid?
  end

  test 'password and _confirmation field cannot be to fewer than 6 characters' do
    @user.password = 'a' * 5
    @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end

  test 'password and password_confirmation must be minimum 6 characters and be identical to be valid' do
    @user.password = 'password'
    @user.password_confirmation = 'PASSWORD'
    assert_not @user.valid?
    @user.password_confirmation = 'password'
    assert @user.valid?
  end
end

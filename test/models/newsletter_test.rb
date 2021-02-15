# frozen_string_literal: true

require 'test_helper'

class NewsletterTest < ActiveSupport::TestCase
  def setup
    @newsletter = newsletters(:hoon)
  end

  test 'newsletter signup must be valid' do
    assert @newsletter.valid?
  end

  # Name specific tests
  test 'first_name must be present' do
    @newsletter.first_name = ''
    assert_not @newsletter.valid?
  end

  test 'last_name must be present' do
    @newsletter.last_name = ''
    assert_not @newsletter.valid?
  end

  test 'first_name meets 3 character minimum' do
    @newsletter.first_name = 'A'
    assert_not @newsletter.valid?
  end

  test 'first_name cannot exceed 50 character maximum' do
    @newsletter.first_name = 'a' * 51
    assert_not @newsletter.valid?
  end

  test 'accepts valid first_name' do
    @newsletter.first_name = 'Hoon'
    assert @newsletter.valid?
  end

  test 'last_name meets 3 character minimum' do
    @newsletter.last_name = 'A'
    assert_not @newsletter.valid?
  end

  test 'last_name cannot exceed 50 character maximum' do
    @newsletter.last_name = 'a' * 51
    assert_not @newsletter.valid?
  end

  test 'accepts valid last_name' do
    @newsletter.last_name = 'Hoon'
    assert @newsletter.valid?
  end

  test 'capitalizes first_name on save' do
    @newsletter.first_name = 'a' * 6
    assert @newsletter.first_name = 'Aaaaaa'
  end

  test 'capitalizes last_name on save' do
    @newsletter.last_name = 'a' * 6
    assert @newsletter.last_name = 'Aaaaaa'
  end

  # Email specific tests
  test 'email must be present' do
    @newsletter.email = ''
    assert_not @newsletter.valid?
  end

  test 'email address canot exceed maximum 255 character length ' do
    @newsletter.email = "#{'a' * 256}@email.com"
    assert_not @newsletter.valid?
  end

  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w[a@a DAVE@DaVe. a_Us-eR.org space-info.jp beef@cows,yum]
    invalid_addresses.each do |invalid_address|
      @newsletter.email = invalid_address
      assert_not @newsletter.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'email validation should accept valid addresses' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @newsletter.email = valid_address
      assert @newsletter.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'accepts valid email address' do
    @newsletter.email = 'actual@email.com'
    assert @newsletter.valid?
  end

  test 'downcases input email address' do
    @newsletter.email = 'CAPSLOCKON@EMAIL.COM'
    @newsletter.save
    assert @newsletter.email = 'capslockon@email.com'
  end

  test 'email address must be unique' do
    duplicate_email = @newsletter.dup
    duplicate_email.email = @newsletter.email
    @newsletter.save
    assert_not duplicate_email.valid?
  end
end

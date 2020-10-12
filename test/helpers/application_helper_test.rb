# frozen_string_literal: true

require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'full title helper' do
    assert_equal full_title, full_title
    assert_equal full_title('About'), 'About | Marin Cricket Club'
    assert_equal full_title('Contact'), 'Contact | Marin Cricket Club'
  end
end

require "test_helper"

class EventMailerTest < ActionMailer::TestCase

  test 'new_event' do
    user = users(:steve)
    event = events(:one)
    mail = EventMailer.new_event(user)
    assert_equal 'Upcoming MCC Event!', mail.subject
    assert_equal [user.email], mail.to
    assert_equal ['noreply@marincricketclub.com'], mail.from
    assert_match user.first_name, mail.body.encoded
    assert_match event.title, mail.body.encoded
    assert_match event.date, mail.body.encoded
    assert_match event.location, mail.body.encoded
    assert_match event.start_time, mail.body.encoded
    assert_match event.about, mail.body.encoded
    assert_match CGI.escape(user.email), mail.body.encoded
  end

  test 'event_cancelled' do
    user = users(:steve)
    event = events(:one)
    mail = EventMailer.event_cancelled(user)
    assert_equal '*** CANCELLED Upcoming MCC Event! CANCELLED ***', mail.subject
    assert_equal [user.email], mail.to
    assert_equal ['noreply@marincricketclub.com'], mail.from
    assert_match user.first_name, mail.body.encoded
    assert_match event.title, mail.body.encoded
    assert_match event.date, mail.body.encoded
    assert_match CGI.escape(user.email), mail.body.encoded
  end

end

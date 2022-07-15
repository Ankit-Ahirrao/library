# frozen_string_literal: true

require 'test_helper'

class BookMailerTest < ActionMailer::TestCase
  test 'issue' do
    mail = BookMailer.issue
    assert_equal 'Issue', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end

  test 'approve' do
    mail = BookMailer.approve
    assert_equal 'Approve', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end

  test 'cancel' do
    mail = BookMailer.cancel
    assert_equal 'Cancel', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end

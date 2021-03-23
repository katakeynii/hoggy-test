require "test_helper"

class SequenceMailerTest < ActionMailer::TestCase
  test "dispatch" do
    mail = SequenceMailer.dispatch
    assert_equal "Dispatch", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

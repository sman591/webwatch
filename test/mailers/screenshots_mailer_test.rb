require 'test_helper'

class ScreenshotsMailerTest < ActionMailer::TestCase
  test "changed" do
    mail = ScreenshotMailer.changed
    assert_equal "Changed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

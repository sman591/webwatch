require 'test_helper'

class ScreenshotsMailerTest < ActionMailer::TestCase
  test "changed" do
    screenshot = Screenshot.first
    screenshot.website = Website.create(url: "http://example.com")
    screenshot.save
    mail = ScreenshotsMailer.changed(screenshot.id)
    assert_match "change", mail.subject
    assert_match "change", mail.body.encoded
  end
end

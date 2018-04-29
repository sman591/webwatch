require 'test_helper'

class ScreenshotsMailerTest < ActionMailer::TestCase
  def setup
    @website = Website.create(url: "http://example.com")
    @screenshot = Screenshot.first
    @screenshot.website = @website
    @screenshot.created_at = 1.day.ago
    @screenshot.save
  end

  test "changed" do
    screenshot2 = @screenshot.dup
    screenshot2.created_at = 5.days.ago
    screenshot2.save

    mail = ScreenshotsMailer.changed(@screenshot.id)
    assert_match "change", mail.subject
    assert_match "change", mail.body.encoded
    assert_match "Previous Screenshot", mail.body.encoded
    assert_no_match "No previous screenshot", mail.body.encoded
  end

  test "changed supports screenshot without previous screenshot" do
    mail = ScreenshotsMailer.changed(@screenshot.id)
    assert_match "No previous screenshot", mail.body.encoded
  end
end

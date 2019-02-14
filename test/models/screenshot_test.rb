require 'test_helper'

class ScreenshotTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  test "diff attributes are blank by default" do
    screenshot = Screenshot.create(website: Website.create)

    assert_nil screenshot.reload.diff_percent
    assert_nil screenshot.reload.diff_date
  end

  test "#submit_diff saves attributes" do
    screenshot = Screenshot.first
    website = Website.first
    screenshot.website = website

    screenshot.submit_diff nil, 25.555
    assert_equal 25.555, screenshot.reload.diff_percent
    assert_in_delta Time.now, screenshot.reload.diff_date, 1.minute
  end

  test "#submit_diff does not queue job when no difference" do
    screenshot = Screenshot.first
    website = Website.first
    screenshot.website = website

    assert_enqueued_jobs 0 do
      screenshot.submit_diff nil, 0.01
    end
  end

  test "#submit_diff queues job with screenshot difference" do
    screenshot = Screenshot.first
    website = Website.first
    screenshot.website = website

    assert_enqueued_jobs 1 do
      screenshot.submit_diff nil, 25.555
    end
  end

  test "#diff? returns false when no diff has been created" do
    screenshot = Screenshot.first
    website = Website.first
    screenshot.website = website

    assert_equal false, screenshot.reload.diff?
  end

  test "#diff? returns false when a diff has been created" do
    screenshot = Screenshot.first
    website = Website.first
    screenshot.website = website

    website.update_attribute(:diff_threshold, 25.000)
    screenshot.submit_diff nil, 25.555
    assert_equal true, screenshot.reload.diff?
  end

  test "#different? returns false when screenshot isn't different" do
    screenshot = Screenshot.first
    website = Website.first
    screenshot.website = website

    website.update_attribute(:diff_threshold, 25.000)

    [24.999, nil, 0].each do |value|
      screenshot.submit_diff nil, value
      assert_equal false, screenshot.reload.different?
    end
  end

  test "#different? returns true when screenshot is different" do
    screenshot = Screenshot.first
    website = Website.first
    screenshot.website = website

    website.update_attribute(:diff_threshold, 25.000)

    [25, 25.555, 70].each do |value|
      screenshot.submit_diff nil, value
      assert_equal true, screenshot.reload.different?
    end
  end

  test "#previous_screenshot" do
    screenshot1 = Screenshot.first
    screenshot2 = Screenshot.first.dup
    screenshot3 = Screenshot.first.dup
    screenshot4 = Screenshot.first.dup
    website = Website.first
    screenshot1.update_attributes(website: website, created_at: 20.days.ago)
    screenshot2.update_attributes(website: website, created_at: 30.days.ago)
    screenshot3.update_attributes(website: website, created_at: 10.days.ago)
    screenshot4.update_attributes(website: website, created_at: 5.days.ago)

    assert_equal screenshot3, screenshot4.previous_screenshot
    assert_equal screenshot1, screenshot3.previous_screenshot
    assert_equal screenshot2, screenshot1.previous_screenshot
    assert_nil screenshot2.previous_screenshot
  end
end

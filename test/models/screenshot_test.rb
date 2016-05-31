require 'test_helper'

class ScreenshotTest < ActiveSupport::TestCase
  test "diff attributes are blank by default" do
    screenshot = Screenshot.create(website: Website.create)

    assert_equal nil, screenshot.reload.diff_percent
    assert_equal nil, screenshot.reload.diff_date
  end

  test "#submit_diff saves attributes" do
    screenshot = Screenshot.first
    website = Website.first
    screenshot.website = website

    screenshot.submit_diff nil, 25.555
    assert_equal 25.555, screenshot.reload.diff_percent
    assert_in_delta Time.now, screenshot.reload.diff_date, 1.minute
  end

  test "#has_diff? returns false when no diff has been created" do
    screenshot = Screenshot.first
    website = Website.first
    screenshot.website = website

    assert_equal false, screenshot.reload.has_diff?
  end

  test "#has_diff? returns false when a diff has been created" do
    screenshot = Screenshot.first
    website = Website.first
    screenshot.website = website

    website.update_attribute(:diff_threshold, 25.000)
    screenshot.submit_diff nil, 25.555
    assert_equal true, screenshot.reload.has_diff?
  end

  test "#is_different? returns false when screenshot isn't different" do
    screenshot = Screenshot.first
    website = Website.first
    screenshot.website = website

    website.update_attribute(:diff_threshold, 25.000)

    [24.999, nil, 0].each do |value|
      screenshot.submit_diff nil, value
      assert_equal false, screenshot.reload.is_different?
    end
  end

  test "#is_different? returns true when screenshot is different" do
    screenshot = Screenshot.first
    website = Website.first
    screenshot.website = website

    website.update_attribute(:diff_threshold, 25.000)

    [25, 25.555, 70].each do |value|
      screenshot.submit_diff nil, value
      assert_equal true, screenshot.reload.is_different?
    end
  end
end

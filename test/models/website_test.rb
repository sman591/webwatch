require 'test_helper'

class WebsiteTest < ActiveSupport::TestCase
  context "url" do
    should allow_value('https://github.com/foo', 'https://bitbucket.org/foo').for(:url)
    should_not allow_value('github.com/foo', 'bitbucket.org/foo', '', nil).for(:url)
  end
end

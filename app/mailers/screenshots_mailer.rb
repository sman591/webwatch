class ScreenshotsMailer < ApplicationMailer

  DEFAULT_FROM_EMAIL = "stuart@stuartolivera.com"
  DEFAULT_TO_EMAIL   = "stuart@stuartolivera.com"

  default from: "\"Web Watch\" <#{DEFAULT_FROM_EMAIL}>"

  def changed(screenshot_id)
    @screenshot = Screenshot.find(screenshot_id)

    subject = "#{@screenshot.diff_percent}\% change on #{@screenshot.website.url}"

    mail to: DEFAULT_TO_EMAIL, subject: subject
  end
end

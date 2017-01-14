class ScreenshotsMailer < ApplicationMailer
  DEFAULT_FROM_EMAIL = "web@watch.oweb.co".freeze
  DEFAULT_TO_EMAIL   = "Stuart Olivera <stuart@stuartolivera.com>".freeze

  default from: "\"Web Watch\" <#{DEFAULT_FROM_EMAIL}>"

  def changed(screenshot_id)
    @screenshot = Screenshot.find(screenshot_id)

    subject = "#{@screenshot.diff_percent}\% change on #{@screenshot.website.url}"

    mail to: DEFAULT_TO_EMAIL, subject: subject
  end
end

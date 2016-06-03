# Preview all emails at http://localhost:3000/rails/mailers/screenshots_mailer
class ScreenshotsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/screenshots_mailer/changed
  def changed
    ScreenshotsMailer.changed(Screenshot.order(created_at: :desc).first.id)
  end

end

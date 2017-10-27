namespace :queue do
  desc "TODO"
  task screenshot_scheduler_job: :environment do
    puts ScreenshotSchedulerJob.perform_now.inspect
  end
end

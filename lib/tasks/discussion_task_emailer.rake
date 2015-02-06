namespace :discussion_task_emailer do

  desc "Send end of day emails "
  task :discussions_and_tasks => :environment do

  @tasks = Task.where("created_at >= :today", {today: Date.today.midnight - 4.days })
  # @tasks = Task.where("created_at >= :today", {today: Date.today.midnight})
  # @discussions = Discussion.where("created_at >= :today", {today: Date.today.midnight})

  EndOfDayMailer.notify_project_owner_tasks(@tasks).deliver_now
  # EndOfDayMailer.notify_project_owner_discussions(@discussions).deliver_now


  end
end

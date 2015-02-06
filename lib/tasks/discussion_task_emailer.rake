namespace :discussion_task_emailer do

  desc "Send end of day emails "
  task :discussions_and_tasks => :environment do

  @tasks = Task.where("created_at >= :today", {today: Date.today.midnight})
  @discussions = Discussion.where("created_at >= :today", {today: Date.today.midnight})





  end
end

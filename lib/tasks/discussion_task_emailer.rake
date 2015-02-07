namespace :discussion_task_emailer do

  desc "Send end of day emails "
  task :discussions_and_tasks => :environment do

  
  # @tasks = Task.where("created_at >= :today", {today: Date.today.midnight})
  # @discussions = Discussion.where("created_at >= :today", {today: Date.today.midnight})

  Project.all.each do |project|
    project.project_members.each do |pm|
      tasks = project.tasks.where("created_at >= :today", {today: Date.today.midnight - 4.days })
      EndOfDayMailer.notify_project_owner_tasks(tasks, pm).deliver_now if tasks.count > 0
    end
  end

  # EndOfDayMailer.notify_project_owner_discussions(@discussions).deliver_now


  end
end

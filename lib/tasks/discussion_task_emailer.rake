namespace :discussion_task_emailer do

  # rake discussion_task_emailer:discussions_and_tasks

  desc "Send end of day emails "
  task :discussions_and_tasks => :environment do

  
  # @tasks = Task.where("created_at >= :today", {today: Date.today.midnight})
  # @discussions = Discussion.where("created_at >= :today", {today: Date.today.midnight})

  Project.find_each do |project|
    user = project.user
    tasks = project.tasks.where("created_at >= :today", {today: Date.today.midnight})
    EndOfDayMailer.notify_project_owner_tasks(tasks, user).deliver_now if tasks.count > 0
  end

    # for each project, loop over project members where pm equals a member
    #   find the tasks on that project that were created today
    #   call end of day mailer notify project owner with the tasks, where pm is the project owner?
    #
  # end

  # Project.all.each do |project|


  # EndOfDayMailer.notify_project_owner_discussions(@discussions).deliver_now


  end
end

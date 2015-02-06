class EndOfDayMailer < ApplicationMailer
  def notify_project_owner_tasks(tasks)
    @tasks = tasks
    @tasks.each do |task|
      @user = User.find(task.project.user_id)
      mail to:@user.email, subject: "New Tasks from #{Date.today}"
    end
  end

  # def notify_project_owner_discussions(discussions)
  #   @discussions = discussions
  #   @discussions.each do |discussion|
  #   @user = User.find(discussion.project.user_id)
  #     mail to:@user.email, subject: "New Tasks from #{Date.today}"
  #   end
  # end

end

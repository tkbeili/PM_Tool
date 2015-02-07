class EndOfDayMailer < ApplicationMailer
  def notify_project_owner_tasks(tasks, user)
    @tasks = tasks
    @user  = user
    mail to: @user.email, subject: "Tasks update for #{Date.today}."
  end

  def notify_project_owner_discussions(discussions, user)
    @discussions = discussions
    @user  = user
    mail to: @user.email, subject: "Discussions update for #{Date.today}."
  end

  # def notify_project_owner_discussions(discussions)
  #   @discussions = discussions
  #   @discussions.each do |discussion|
  #   @user = User.find(discussion.project.user_id)
  #     mail to:@user.email, subject: "New Tasks from #{Date.today}"
  #   end
  # end

end

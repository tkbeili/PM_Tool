class Comment < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :user
  has_one :project, through: :discussion
  validates :body, presence: true

  def user_first_name
    user.first_name if user
  end  

end

class Discussion < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :comments, dependent: :nullify
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true

  def user_first_name
    user.first_name if user
  end
  
end



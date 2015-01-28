class Comment < ActiveRecord::Base
  belongs_to :discussion 
  has_one :project, through: :discussion
  validates :body, presence: true
end

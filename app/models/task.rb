class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :title, presence: true
  validates_uniqueness_of :title, case_sensitive: false, scope: :project_id
end

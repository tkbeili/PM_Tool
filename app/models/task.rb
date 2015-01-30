class Task < ActiveRecord::Base
  belongs_to :project
  validates :title, presence: true
  # uniqueness within a project. How? like this?
  validates_uniqueness_of :title, case_sensitive: false, scope: :project_id
end

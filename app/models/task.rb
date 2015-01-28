class Task < ActiveRecord::Base
  belongs_to :project
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  # uniqueness within a project. How? like this?
  
end

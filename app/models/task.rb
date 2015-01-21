class Task < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  # uniqueness within a project. How? like this?
  
end

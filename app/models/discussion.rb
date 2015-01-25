class Discussion < ActiveRecord::Base
  belongs_to :project
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
end



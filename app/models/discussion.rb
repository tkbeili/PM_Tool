class Discussion < ActiveRecord::Base
  belongs_to :project
  has_many :comments, dependent: :nullify
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
end



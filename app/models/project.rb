class Project < ActiveRecord::Base
  belongs_to :user
  has_many :discussions, dependent: :nullify
  has_many :comments, through: :discussions
  has_many :tasks, dependent: :destroy

  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites

  has_many :members, dependent: :destroy
  has_many :project_members, through: :members, source: :user
  
  validates :title, presence: true, uniqueness: { case_sensitive: false }

  def self.search(query)
    where("title ILIKE ? OR description ILIKE ?", "%#{query}%", "%#{query}%")
  end

  def user_first_name
    if user
      user.first_name 
    else
      return "Retardo Maltoban"
    end
  end

end

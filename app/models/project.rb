class Project < ActiveRecord::Base
  belongs_to :user
  has_many :discussions, dependent: :nullify
  has_many :comments, through: :discussions
  has_many :tasks, dependent: :destroy

  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites

  has_many :members, dependent: :destroy
  has_many :project_members, through: :members, source: :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  
  validates :title, presence: true, uniqueness: { case_sensitive: false }

  def self.search(query)
    where("title ILIKE ? OR description ILIKE ?", "%#{query}%", "%#{query}%")
  end

  def user_first_name
    if user
      user.first_name 
    else
      return "Private"
    end
  end

  def user_full_name
    if user
      "#{user.first_name} #{user.last_name}"
    else
      return "Private Manager"
    end
  end

end

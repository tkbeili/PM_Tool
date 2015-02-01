class Project < ActiveRecord::Base
  belongs_to :user
  has_many :discussions, dependent: :nullify
  has_many :comments, through: :discussions
  has_many :tasks, dependent: :destroy
  validates :title, presence: true, uniqueness: { case_sensitive: false }

  def self.search(query)
    where("title ILIKE ? OR description ILIKE ?", "%#{query}%", "%#{query}%")
  end

  def user_first_name
    if user
      user.first_name 
    else
      return "Retardo Maltobahn"
    end
  end

end

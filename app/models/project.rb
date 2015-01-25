class Project < ActiveRecord::Base
  has_many :discussions, dependent: :nullify
  validates :title, presence: true, uniqueness: { case_sensitive: false }

  def self.search(query)
    where("title ILIKE ? OR description ILIKE ?", "%#{query}%", "%#{query}%")
  end

end

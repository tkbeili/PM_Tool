class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects, dependent: :nullify
  has_many :discussions, dependent: :nullify
  has_many :comments, dependent: :destroy
  has_many :tasks, dependent: :nullify

  has_many :favourites, dependent: :destroy
  has_many :favourited_projects, through: :favourites, source: :project

  has_many :members, dependent: :destroy
  has_many :member_projects, through: :members, source: :project

  def has_favourited?(project)
    favourited_projects.include? project
  end

  def full_name
    if first_name || last_name
      "#{first_name} #{last_name}".squeeze(" ").strip
    else
      email
    end
  end

end

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

  def has_favourited?(project)
    favourited_projects.include? project
  end

end

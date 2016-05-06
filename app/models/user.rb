class User < ActiveRecord::Base
  has_many :proposals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    return false if admin.nil?
    admin
  end

  def teacher?
    return false if teacher.nil?
    teacher
  end

  def name
    "#{firstname} #{lastname}"
  end
end

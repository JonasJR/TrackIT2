class User < ActiveRecord::Base
  has_many :proposals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    !(admin.nil?)
  end

  def teacher?
    !(teacher.nil?)
  end
end

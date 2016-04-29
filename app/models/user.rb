class User < ActiveRecord::Base
  has_many :proposals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    if admin == nil
      return false
    else
      return true
    end
  end

  def teacher?
    if teacher == nil
      return false
    else
      return true
    end
  end
end

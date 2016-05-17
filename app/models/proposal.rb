class Proposal < ActiveRecord::Base
  scope :approved, -> { where(approved: true) }
  scope :pending, -> { where(approved: false) }

  belongs_to :user

  def self.search(query)
     where("name like ?","%#{query}%").all
  end
end

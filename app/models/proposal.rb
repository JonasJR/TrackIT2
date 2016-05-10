class Proposal < ActiveRecord::Base
  scope :approved, -> { where(approved: true) }
  belongs_to :user
end

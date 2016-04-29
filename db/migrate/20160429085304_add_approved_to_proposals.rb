class AddApprovedToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :approved, :boolean
  end
end

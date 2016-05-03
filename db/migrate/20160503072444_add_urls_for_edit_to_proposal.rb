class AddUrlsForEditToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :vsc_url, :string
    add_column :proposals, :project_managment_service, :string
  end
end

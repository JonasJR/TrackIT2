class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.string :category
      t.string :course
      t.string :company
      t.timestamps null: false
    end
  end
end

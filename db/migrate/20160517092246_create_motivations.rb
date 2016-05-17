class CreateMotivations < ActiveRecord::Migration
  def change
    create_table :motivations do |t|
      t.text :motivation
      t.integer :user_id
      t.integer :proposal_id

      t.timestamps null: false
    end
  end
end

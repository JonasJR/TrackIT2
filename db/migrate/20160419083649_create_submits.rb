class CreateSubmits < ActiveRecord::Migration
  def change
    create_table :submits do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end

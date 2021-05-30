class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.boolean :all_day
      t.text :note

      t.timestamps
    end
  end
end

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :start_at
      t.integer :end_at
      t.string :allday
      t.string :memo

      t.timestamps
    end
  end
end

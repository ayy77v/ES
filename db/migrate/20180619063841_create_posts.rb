class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :description
      t.string :text
      t.integer :group_id

      t.timestamps
    end
  end
end

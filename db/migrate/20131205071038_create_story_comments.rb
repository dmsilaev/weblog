class CreateStoryComments < ActiveRecord::Migration
  def change
    create_table :story_comments do |t|
      t.integer :user_id
      t.integer :story_id
      t.text :body

      t.timestamps
    end
  end
end

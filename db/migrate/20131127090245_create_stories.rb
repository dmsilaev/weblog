# -*- encoding : utf-8 -*-
class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :url
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end

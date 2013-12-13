class AddHostIdToStory < ActiveRecord::Migration
  def change
    add_column :stories, :host_id, :integer
  end
end

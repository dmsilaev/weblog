class RemoveDomainFromStory < ActiveRecord::Migration
  def change
    remove_column :stories, :domain
  end
end

# -*- encoding : utf-8 -*-
class AddLoginToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login, :string
  end
end

class AddImgurlToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :imgurl, :string
  end

  def self.down
    remove_column :users, :imgurl
  end
end

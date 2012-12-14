class RemovePledges < ActiveRecord::Migration
  def change
    drop_table :pledges
    drop_table :posts
  end
end

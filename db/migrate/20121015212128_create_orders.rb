class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.integer :id
      t.string :location
      t.text :contents
      t.string :type
      t.string :status

      t.timestamps
    end
  end
end

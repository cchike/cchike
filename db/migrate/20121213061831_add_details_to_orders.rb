class AddDetailsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :customer_email, :string
    add_column :orders, :vendor, :string
    add_column :orders, :ready_for_pickup, :boolean
    change_table :orders do |t|
      t.rename :name, :customer_name
      t.rename :location, :address
    end
  end
end

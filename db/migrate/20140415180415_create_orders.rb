class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :robot, index: true

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :userType
      t.text :about
      t.string :photoPath

      t.timestamps
    end
  end
end

require 'pathname'

class CreateRobots < ActiveRecord::Migration
  def change
    create_table :robots do |t|
      t.string :name
      t.text :description
	  t.string :photoPath
	  t.references :user, index: true

      t.timestamps
    end
  end
end

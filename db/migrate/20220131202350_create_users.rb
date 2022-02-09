# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.text :biograph

      t.timestamps
      add_index :users, :name, unique: true
    end
  end
end

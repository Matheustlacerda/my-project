# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.date :bith_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
      add_index :contacts, %i[name user_id], unique: true
    end
  end
end

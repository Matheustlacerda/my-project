# frozen_string_literal: true

class CreatePhoneNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :phone_numbers do |t|
      t.string :number
      t.string :number_type
      t.boolean :main
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end

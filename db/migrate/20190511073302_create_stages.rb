# frozen_string_literal: true

class CreateStages < ActiveRecord::Migration[5.2]
  def change
    create_table :stages do |t|
      t.string :name, null: false
      t.references :work, foreign: true

      t.timestamps
    end
  end
end

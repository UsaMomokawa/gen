# frozen_string_literal: true

class CreateStages < ActiveRecord::Migration[5.2]
  def change
    create_table :stages do |t|
      t.references :work, foreign: true
      t.string :name, null: false
    end
  end
end

class CreateStages < ActiveRecord::Migration[5.2]
  def change
    create_table :stages do |t|
      t.string :name, null: false
      t.references :user, foreign: true

      t.timestamps
    end
  end
end

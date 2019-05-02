class CreateStages < ActiveRecord::Migration[5.2]
  def change
    create_table :stages do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
    end
  end
end

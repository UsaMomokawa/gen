class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.boolean :matter, default: false, null: false
      t.references :work, foreign_key: true

      t.timestamps
    end
  end
end

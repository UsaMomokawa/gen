class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.belongs_to :work, foreign_key: true
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end

class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.references :stage, foreign: true
      t.integer :status, default: 0, null: false
    end
  end
end

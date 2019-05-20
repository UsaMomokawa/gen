class CreateProgresses < ActiveRecord::Migration[5.2]
  def change
    create_table :progresses do |t|
      t.integer :status, default: 0, null: false
      t.references :stage, foreign_key: true
      t.references :page, foreign_key: true

      t.timestamps
    end
  end
end

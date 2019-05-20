class AddWorksRefToProgresses < ActiveRecord::Migration[5.2]
  def change
    add_reference :progresses, :work, foreign_key: true
  end
end

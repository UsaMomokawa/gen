class AddDeadlineToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :deadline, :date
  end
end

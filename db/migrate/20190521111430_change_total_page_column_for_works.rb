class ChangeTotalPageColumnForWorks < ActiveRecord::Migration[5.2]
  def change
    change_column_null :works, :total_page, false
  end
end

class RemoveTotalPageColumnFromWorks < ActiveRecord::Migration[5.2]
  def change
    remove_column :works, :total_page, :integer
  end
end

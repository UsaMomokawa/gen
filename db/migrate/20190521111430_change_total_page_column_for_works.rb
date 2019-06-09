# frozen_string_literal: true

class ChangeTotalPageColumnForWorks < ActiveRecord::Migration[5.2]
  def change
    change_column_null :works, :total_page, false, 4
  end
end

# frozen_string_literal: true

class AddTotalPageToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :total_page, :integer
  end
end

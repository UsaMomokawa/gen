class AddUsersRefToWorks < ActiveRecord::Migration[5.2]
  def change
    add_reference :works, :user, foreign_key: true
  end
end

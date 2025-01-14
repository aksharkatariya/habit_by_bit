class AddHabitsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :habit_one, :string
    add_column :users, :habit_two, :string
  end
end

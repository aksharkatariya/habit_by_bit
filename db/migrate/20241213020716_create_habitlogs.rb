class CreateHabitlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :habitlogs do |t|
      t.binary :Habit1Minutes
      t.binary :Habit2Minutes
      t.text :Motivation

      t.timestamps
    end
  end
end

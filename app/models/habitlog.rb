# == Schema Information
#
# Table name: habitlogs
#
#  id            :bigint           not null, primary key
#  Habit1Minutes :binary
#  Habit2Minutes :binary
#  Motivation    :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Habitlog < ApplicationRecord
end

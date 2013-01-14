class TherapiesExercise < ActiveRecord::Base
  attr_accessible :therapy_id, :exercise_id, :position

  default_scope order('position asc')

  belongs_to :therapy
  belongs_to :exercise
end

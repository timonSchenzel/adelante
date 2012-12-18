class TherapiesExercises < ActiveRecord::Base
  attr_accessible :therapy_id, :exercise_id

  belongs_to :therapy
  belongs_to :exercise
end

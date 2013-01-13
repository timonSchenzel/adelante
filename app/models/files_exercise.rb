class FilesExercise < ActiveRecord::Base
  attr_accessible :exercise_id, :exercise_file_id

  belongs_to :exercise
  belongs_to :exercise_file
end

class FilesExercise < ActiveRecord::Base
  attr_accessible :exercise_id, :files_id

  belongs_to :exercise
  belongs_to :file
end

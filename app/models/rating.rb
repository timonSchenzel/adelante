class Rating < ActiveRecord::Base
	attr_accessible :score, :previous_exercise, :connects, :client_level, :progress_t, :progress_c
  belongs_to :exercise
end
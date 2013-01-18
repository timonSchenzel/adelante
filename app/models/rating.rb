class Rating < ActiveRecord::Base
	attr_accessible :score, :previous_exercise, :connects, :client_level, :progress_t, :progress_c, :exercise_id, :description
  belongs_to :exercise

  has_many :ratings_notes
  has_many :notes, :through => :ratings_notes

  accepts_nested_attributes_for :notes
end
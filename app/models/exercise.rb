class Exercise < ActiveRecord::Base
  attr_accessible :description, :name, :position, :exercise_files_attributes

  has_many :therapies_exercises
  has_many :therapies, :through => :therapies_exercises

  has_many :ratings
  has_many :files_exercises
  has_many :exercise_files, :through => :files_exercises

  has_many :clientsessions_exercises
  has_many :clientsessions, :through => :clientsessions_exercises


  accepts_nested_attributes_for :exercise_files
end

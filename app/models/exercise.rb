class Exercise < ActiveRecord::Base
  attr_accessible :description, :name, :files_attributes

  belongs_to :therapies_exercises
  has_many :ratings
  has_many :files_exercises
  has_many :files, :through => :files_exercises
  accepts_nested_attributes_for :files
end

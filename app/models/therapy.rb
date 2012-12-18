class Therapy < ActiveRecord::Base
  attr_accessible :description, :name, :exercises_attributes

  has_many :exercises, :through => :therapies_exercises
  accepts_nested_attributes_for :exercises
end

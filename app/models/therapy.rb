class Therapy < ActiveRecord::Base
  attr_accessible :description, :name, :exercises_attributes, :exercises_attributes

  has_many :therapies_exercises
  has_many :exercises, :through => :therapies_exercises

  has_many :clientsessions_therapies
  has_many :clientsessions, :through => :clientsessions_therapies

  has_many :therapies_tags
  has_many :tags, :through => :therapies_tags

  has_many :saved_therapies

  accepts_nested_attributes_for :exercises

  scope :recent_limit, :order => :updated_at, :limit => "8"
end

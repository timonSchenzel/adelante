class Therapy < ActiveRecord::Base
  attr_accessible :description, :name, :exercises_attributes, :exercises_attributes

  has_many :therapies_exercises
  has_many :exercises, :through => :therapies_exercises

  has_many :clientsessions_therapies
  has_many :clientsessions, :through => :clientsessions_therapies

  has_many :therapies_tags
  has_many :tags, :through => :therapies_tags

  has_many :saved_therapies

  has_many :colleagues_shares

  accepts_nested_attributes_for :exercises, :clientsessions

  scope :recent_limit, :order => :updated_at, :limit => "8"

  def find_exercises_session(id)
    self.exercises.find_by_sql("
      SELECT E.* FROM exercises AS E 
        JOIN clientsessions_exercises AS CSE ON CSE.exercise_id=E.id
      WHERE CSE.clientsession_id = #{id}");

  end
end

class Clientsession < ActiveRecord::Base
  attr_accessible :client_id, :date, :therapies_attributes, :exercises_attributes, :ratings_attributes, :notes_attributes

  #belongs_to :client
  has_many :clientsessions_exercises
  has_many :therapies ,:through => :clientsessions_exercises
  has_many :exercises, :through => :clientsessions_exercises

  belongs_to :therapist;

  has_many :notes

  has_many :clientsessions_ratings
  has_many :ratings, :through => :clientsessions_ratings

  accepts_nested_attributes_for :therapies, :exercises, :ratings, :clientsessions_ratings, :notes
  
  def therapist_name(id)
  	Clientsession.find_by_sql("SELECT name FROM therapists WHERE id = #{id}");
  end

end

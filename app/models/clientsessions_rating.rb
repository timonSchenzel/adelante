class ClientsessionsRating < ActiveRecord::Base
  attr_accessible :rating_id, :clientsession_id, :exercise_id, :notes_attributes

  belongs_to :clientsession
  belongs_to :rating

  has_many :ratings_notes

  has_many :notes, :through => :ratings_notes

  accepts_nested_attributes_for :notes

end
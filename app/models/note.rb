class Note < ActiveRecord::Base
  attr_accessible :description, :name, :sessions_id
  belongs_to :clientsession

  has_many :ratings_notes
  has_many :ratings, :through => :ratings_notes

  accepts_nested_attributes_for :ratings
end

class Clientsession < ActiveRecord::Base
  attr_accessible :client_id, :date
  #belongs_to :client
  has_many :clientsessions_therapies
  has_many :therapies ,:through => :clientsessions_therapies

  has_many :clientsessions_exercises
  has_many :exercises, :through => :clientsessions_exercises

  has_many :notes
end

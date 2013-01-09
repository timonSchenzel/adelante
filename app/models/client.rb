class Client < ActiveRecord::Base
  attr_accessible :name, :photo
  has_many :clients_therapists
  has_many :therapists, :through => :clients_therapists
  has_one :dossier

  has_many :clientsessions

  #belongs_to :therapist

end

class Client < ActiveRecord::Base
 # attr_accessible :name
 has_one :dossier
 has_many :notes
 has_many :clients_therapies
 has_many :therapies, :through => :clients_therapies
end
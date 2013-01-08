class ClientsTherapists < ActiveRecord::Base
  attr_accessible :clients_id, :therapists_id
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :therapists
end

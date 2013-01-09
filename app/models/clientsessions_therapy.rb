class ClientsessionsTherapy < ActiveRecord::Base
  attr_accessible :clientsession_id, :therapy_id
  belongs_to :clientsession
  belongs_to :therapy
end

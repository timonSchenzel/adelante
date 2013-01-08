class ClientsTherapies < ActiveRecord::Base
  attr_accessible :client_id, :therapy_id
  belongs_to :client
  belongs_to :therapist
end

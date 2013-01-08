class ClientsTherapist < ActiveRecord::Base
  attr_accessible :client_id, :therapist_id
  belongs_to :client
  belongs_to :therapist
end

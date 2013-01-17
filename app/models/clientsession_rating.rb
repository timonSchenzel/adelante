class ClientsessionsRating < ActiveRecord::Base
  belongs_to :rating
  belongs_to :clientsession
end

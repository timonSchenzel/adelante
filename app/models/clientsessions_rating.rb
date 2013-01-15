class ClientsessionsRating < ActiveRecord::Base
  attr_accessible :rating_id,:clientsession_id

  belongs_to :clientsession
  belongs_to :rating

end
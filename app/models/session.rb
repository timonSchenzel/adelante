class Session < ActiveRecord::Base
  attr_accessible :client_id, :date
  has_many :sessions_therapies
  has_many :therapies ,:through => :sessions_therapies
end

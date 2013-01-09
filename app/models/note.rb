class Note < ActiveRecord::Base
  attr_accessible :description, :name, :sessions_id
  belongs_to :clientsession
end

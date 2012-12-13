class Note < ActiveRecord::Base
  attr_accessible :name, :description, :client_id
  belongs_to :client

end

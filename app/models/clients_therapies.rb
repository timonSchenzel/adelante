class ClientsTherapies < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :clients
  has_many :therapies
end

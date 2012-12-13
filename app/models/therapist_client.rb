class TherapistClient < ActiveRecord::Base
  # attr_accessible :title, :body
  #has_many :clients
  #has_many :therapists
  belongs_to :client
end

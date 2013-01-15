class Dossier < ActiveRecord::Base
  attr_accessible :client_id, :name

  has_many :dossier_items
end

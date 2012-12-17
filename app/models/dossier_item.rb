class DossierItem < ActiveRecord::Base
  attr_accessible :description, :dossier_id, :name
end

class DossierItem < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :dossiers
end

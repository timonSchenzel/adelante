class TherapistsTherapy < ActiveRecord::Base
  attr_accessible :therapies_id, :therapists_id, :is_creator

  belongs_to :therapist
  belongs_to :therapy
end

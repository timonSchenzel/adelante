class TherapistsTherapy < ActiveRecord::Base
  attr_accessible :therapy_id, :therapist_id, :is_creator

  belongs_to :therapist
  belongs_to :therapy
end

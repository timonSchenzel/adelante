class SavedTherapy < ActiveRecord::Base
  attr_accessible :therapy_id, :therapist_id

  belongs_to :therapist
  belongs_to :therapy
end

class SavedTherapy < ActiveRecord::Base
  attr_accessible :therapy_id, :tag_id

  belongs_to :therapist
  belongs_to :therapy
end

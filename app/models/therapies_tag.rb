class TherapiesTag < ActiveRecord::Base
  attr_accessible :therapy_id, :tag_id

  belongs_to :tag
  belongs_to :therapy
end

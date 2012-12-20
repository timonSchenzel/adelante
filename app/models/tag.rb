class Tag < ActiveRecord::Base
  attr_accessible :tag

  belongs_to :therapy
  belongs_to :therapies_tag
  belongs_to :exercise
end

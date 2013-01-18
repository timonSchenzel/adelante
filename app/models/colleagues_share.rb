class ColleaguesShare < ActiveRecord::Base

  attr_accessible :therapist_id, :colleague_id, :therapy_id, :message

  belongs_to :therapist
  belongs_to :colleague
  belongs_to :therapy
  #belongs_to :friend, class_name: 'Colleague', :foreign_key => 'colleague_id'
end

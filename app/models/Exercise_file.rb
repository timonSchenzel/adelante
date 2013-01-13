class ExerciseFile < ActiveRecord::Base
  attr_accessible :name, :attachment, :location, :created_at, :updated_at

  #attr_accessor :attachment_file_name
  #attr_accessor :attachment_content_type
  #attr_accessor :attachment_file_size
  #attr_accessor :attachment_updated_at

  has_attached_file :attachment, :url => '/scripts/:basename.:extension'

  belongs_to :files_exercises
end

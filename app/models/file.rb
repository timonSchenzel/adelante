class File < ActiveRecord::Base
  attr_accessible :name, :location, :created_at, :updated_at

  belongs_to :therapies_exercises
end

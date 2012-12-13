class Therapy < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :exercises
  belongs_to :therapist

end

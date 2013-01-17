class RatingsNote < ActiveRecord::Base
  belongs_to :rating
  belongs_to :note
end
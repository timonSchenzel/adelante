class Exercise < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :therapy

end

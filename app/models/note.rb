class Note < ActiveRecord::Base
  attr_accessible :description, :name, :sessions_id
end

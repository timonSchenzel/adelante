class ClientsessionsExercise < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :clientsession
end
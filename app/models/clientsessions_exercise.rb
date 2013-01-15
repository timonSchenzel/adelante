class ClientsessionsExercise < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :clientsession
  belongs_to :therapy
end
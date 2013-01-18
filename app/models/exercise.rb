class Exercise < ActiveRecord::Base
  attr_accessible :description, :name, :position, :exercise_files_attributes

  has_many :therapies_exercises
  has_many :therapies, :through => :therapies_exercises

  has_many :ratings
  has_many :files_exercises
  has_many :exercise_files, :through => :files_exercises

  has_many :clientsessions_exercises
  has_many :clientsessions, :through => :clientsessions_exercises

  accepts_nested_attributes_for :exercise_files, :clientsessions

    def find_therapy_session(id,exercise_id)
    self.therapies.find_by_sql("
      SELECT T.name FROM exercises AS E 
        JOIN clientsessions_exercises AS CSE ON CSE.exercise_id=E.id
        JOIN therapies AS T on T.id=CSE.therapy_id
      WHERE CSE.clientsession_id = #{id}
      AND CSE.exercise_id = #{exercise_id}");
  	end

  	def sessionrating(id,exercise_id)
    self.ratings.find_by_sql("
      SELECT R.* FROM ratings AS R 
        JOIN clientsessions_ratings AS CSR ON CSR.rating_id=R.id
      WHERE CSR.clientsession_id = #{id}
      AND R.exercise_id = #{exercise_id}");
  	end

  def count_ups
    if self.ratings.nil?
      return 0
    else
      count = self.ratings.count
      if count.nil?
        return 0
      else
        return count
      end
    end
  end

  def count_downs
    if self.ratings.nil?
      return 0
    else
    count = self.ratings.count
      if count.nil?
        return 0
      else
        return count
      end
    end
  end

end

class TherapiesExercisesController < ApplicationController

  before_filter :signed_in_user

  def create

    if !params[:added_exercises].nil?
      ids = params[:added_exercises]

      ids.each do |exercise_id|
        TherapiesExercise.create(therapy_id: params[:therapy_id], exercise_id: exercise_id)
      end
    end
    redirect_to new_exercise_question_path(id: params[:therapy_id])
  end

end
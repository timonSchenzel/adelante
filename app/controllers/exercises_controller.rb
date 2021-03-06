class ExercisesController < ApplicationController

  before_filter :signed_in_user

  #def index
  #  @therapies = Therapy.all
    #@game.rounds.build
  #end

  #def show

  #end

  def new
    @exercise = Exercise.new
    @exercise.exercise_files.build
  end

  def create
    @therapy = Therapy.find(params[:therapy_id])
    #params[:exercise][:position] = @therapy.exercises.count + 1
    new_exercise = @therapy.exercises.create(params[:exercise])

    #params[:tags].split(',').each do |value|
      #Exists this tag already in the database?
      #new_tag = Tag.find_by_tag(value.downcase)
      #if(new_tag.nil?) #It don't exists, so create it
        #new_tag = Tag.create({ tag: value.downcase })
      #end
      #TherapiesTags.create({ therapy_id: new_therapy.id, tag_id: new_tag.id })
    #end

    redirect_to new_exercise_question_path(id: @therapy.id)
  end

  def add_existing
    @therapies_exercises = TherapiesExercise.new
  end

  def new_question
    @therapy = Therapy.find(params[:id])
  end

  def new_or_existing_question

  end

  def position
    @therapy = Therapy.find(params[:id])
    #@exercises_by_order = @therapy.exercises.all(order: :position)
  end

  def update_order
    counter = 0
    params[:exercise].each do |exercise|
      @exercise_id = exercise.to_i
      counter = counter + 1
      update_exercise = TherapiesExercise.find_by_therapy_id_and_exercise_id(params[:therapy_id], @exercise_id)

      p "--------------"
      p update_exercise
      p "--------------"

      update_exercise.position = counter
      update_exercise.save
    end
  end

  def existing_suggestions
      exercises_array = Array.new

      if(params.has_key?(:therapy) == true)
       exercises = Therapy.find("#{params[:therapy]}").exercises;

       exercises.each do |exercise|
          exercises_array.push({ id: exercise.id, name: exercise.name })
       end
      else
       exercises = Exercise.where("name like ?", "%#{params[:term]}%").limit(30)
       exercises.each do |exercise|
          exercises_array.push({ id: exercise.id, name: exercise.name })
        end
      end
        render :json => exercises_array
  end

  def autocomplete
    tags = Tag.where("tag like ?", "%#{params[:term]}%")
    tag_array = Array.new
    tags.each do |tag|
      tag_array.push(tag.tag)
    end
    render :json => tag_array
  end

end
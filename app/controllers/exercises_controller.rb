class ExercisesController < ApplicationController

  before_filter :signed_in_user

  def index
    @therapies = Therapy.all
    #@game.rounds.build
  end

  def show

  end

  def new
    @exercise = Exercise.new
    #1.times do |number|
    #  @exercise.files.build
    #end
  end

  def create
    new_therapy = Therapy.create(params[:therapy])
    params[:tags].split(',').each do |value|
      #Exists this tag already in the database?
      new_tag = Tag.find_by_tag(value.downcase)
      if(new_tag.nil?) #It don't exists, so create it
        new_tag = Tag.create({ tag: value.downcase })
      end
      TherapiesTags.create({ therapy_id: new_therapy.id, tag_id: new_tag.id })
    end

    redirect_to new_exercise_path(id: new_therapy.id)
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
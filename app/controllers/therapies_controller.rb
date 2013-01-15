class TherapiesController < ApplicationController

  before_filter :signed_in_user

  def index
    @therapies = Therapy.all(order: 'id desc')

    @latest_therapies = Therapy.recent_limit

    @therapy = Therapy.new
    #1.times do |number|
    #  @therapy.exercises.build
    #end
  end

  def show
    @therapy = Therapy.find(params[:id])
    @ajax = request.xhr?

    if request.xhr?
      render layout: false
    end
  end

  def create
    new_therapy = Therapy.create(params[:therapy])
    params[:tags].split(',').each do |value|
      #Exists this tag already in the database?
      new_tag = Tag.find_by_tag(value.downcase)
      if(new_tag.nil?) #It don't exists, so create it
        new_tag = Tag.create({ tag: value.downcase })
      end
      TherapiesTag.create({ therapy_id: new_therapy.id, tag_id: new_tag.id })
    end

    #Add the therapist creator
    @current_user.therapists_therapies.create({ therapy_id: new_therapy.id, is_creator: true })

    redirect_to new_or_existing_question_path(id: new_therapy.id)
  end

  def autocomplete
    tags = Tag.where("tag like ?", "%#{params[:term]}%")
    tag_array = Array.new
    tags.each do |tag|
      tag_array.push(tag.tag)
    end
    render :json => tag_array
  end

  def show_suggestions
    therapies = Therapy.where("name like ?", "%#{params[:term]}%").limit(20)
    therapies_array = Array.new
    therapies.each do |therapy|
      therapies_array.push({ id: therapy.id, name: therapy.name })
    end
    render :json => therapies_array
  end

end
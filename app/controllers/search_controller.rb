class SearchController < ApplicationController

  before_filter :signed_in_user

  def suggestions
    therapies = Therapy.find(:all, :limit => 10, :include => [:therapies_tags, :tags], :conditions => ["tags.tag = ?", "%#{params[:term]}%"], :select => "therapies.*")
    exercises = Exercise.find(:all, :limit => 10, :conditions => ["exercises.name LIKE ?", "%#{params[:term]}%"], :select => "exercises.*")

    #.where("tags.tag = ?", "%#{params[:terms]}%")
    #tags = Tag.where("tag like ?", "%#{params[:term]}%")
    therapies_array = Array.new
    therapies.each do |therapy|
      therapies_array.push(therapy.name)
    end

    exercises_array = Array.new
    exercises.each do |therapy|
      exercises_array.push(therapy.name)
    end

    render :json => [therapies: therapies_array, exercises: exercises_array]
  end

end
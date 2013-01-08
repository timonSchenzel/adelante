class SearchController < ApplicationController

  before_filter :signed_in_user

  def suggestions
    therapies = Therapy.all(:limit => 10, :joins => :tags,
                             :conditions => ["tags.tag LIKE ?", "%#{params[:term]}%"], :select => "therapies.*")
    exercises = Exercise.all(:limit => 10, :conditions => ["exercises.name LIKE ?", "%#{params[:term]}%"], :select => "exercises.*")

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
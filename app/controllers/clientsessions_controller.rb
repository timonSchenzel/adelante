class ClientsessionsController < ApplicationController
  before_filter :signed_in_user

  def new
    @render_header = false
    @render_footer = false
  end

  def create
    @client = Client.find(params[:client_id]);

    @newClientsession = Clientsession.new
        @newClientsession.date = params[:clientsession][:date]
        @newClientsession.client_id = params[:client_id];
        @newClientsession.therapist_id = @current_user.id.to_i;
    
      params[:selected_exercise].each do |exerciseId|
       @addExercise = @newClientsession.clientsessions_exercises.new
        @addExercise.exercise_id  = exerciseId.to_i
        @addExercise.therapy_id  = params[:selected_therapy].to_i

        @newRating = @newClientsession.ratings.new
        @newRating.client_id = params[:client_id];
        @newRating.exercise_id = exerciseId.to_i
      end

    @newClientsession.save
    @params = params
    #redirect_to(@client, :notice => "De sessie is toegevoegd.")
  end

  def edit
    @clientSession = Clientsession.find(params[:id]);
    @therapist = @clientSession.therapist
    #@clientExercises = @clientSession.exercises
    #@clientRating = @clientSession.ratings
  end

  def update
    #@deparams = params
    @client = Client.find(params[:clientsession][:client_id])
    @clientSession = Clientsession.find(params[:id])
   
    @clientRating = @clientSession.ratings.first

    params[:clientsession][:ratings_attributes].each do |i,ur|
          @clientRating.update_attributes(ur)
    end

    @clientRating.save
   
    redirect_to(@client, :notice => "De sessie is bewerkt.")
    @deparams = params[:clientsession][:ratings_attributes].first;
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end

class TherapiesController < ApplicationController

  before_filter :signed_in_user

  def index
    @therapies = Therapy.all
    #@game.rounds.build
  end

  def home
    @therapy = Therapy.new
  end

end
class TherapiesController < ApplicationController

  before_filter :signed_in_user

  def index
    @therapy = Therapy.new
    #@game.rounds.build
  end

  def home
    @therapy = Therapy.new
  end

end
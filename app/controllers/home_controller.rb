class HomeController < ApplicationController

  before_filter :signed_in_user

  def index
    @therapy = Therapy.new
    #@game.rounds.build
  end

  def home
    @therapy = Therapy.new
  end

  def testfunctie

  end

end
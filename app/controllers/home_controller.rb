class HomeController < ApplicationController

  before_filter :signed_in_user

  def index
    @therapy = Therapy.new
    @therapy.exercises.build
  end

  def home
    @therapy = Therapy.new
  end

end
class HomeController < ApplicationController

  before_filter :signed_in_user

  def index
    @all_therapies = Therapy.all
    @therapy = Therapy.new
  end

  def home
    @all_therapies = Therapy.all
    @therapy = Therapy.new
    1.times do |number|
      @therapy.exercises.build
    end
  end

end
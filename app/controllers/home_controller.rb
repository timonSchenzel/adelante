class HomeController < ApplicationController

  before_filter :signed_in_user

  def index
    @therapy = Therapy.new
  end

  def home
    @therapy = Therapy.new
    1.times do |number|
      @therapy.exercises.build
    end
  end

end
class HomeController < ApplicationController

  before_filter :signed_in_user

  def index

  end

  def home

  end

end
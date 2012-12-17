class HomeController < ApplicationController

  #before_filter :signed_in_user

  def index
    @render_header = false
    @render_footer = false;
  end

  def home
    @render_header = false
    @render_footer = false
  end

end
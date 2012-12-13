class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionHelper

  @render_header = true
  @render_footer = true
end

class SavedTherapiesController < ApplicationController
  before_filter :signed_in_user

  def create
    if @current_user.saved_therapies.find_by_therapy_id(params[:id]).nil?
      @current_user.saved_therapies.create({ therapy_id: params[:id] })
    end
    redirect_to therapies_url
  end

  def delete
    @current_user.saved_therapies.find_by_therapy_id(params[:id]).destroy

    redirect_to therapies_url
  end
end
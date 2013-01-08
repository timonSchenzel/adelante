class ClientsController < ApplicationController
  before_filter :signed_in_user

  def index
    @personal_clients = Therapist.find(@current_user.id).clients()
    @other_clients = Therapist.where("id != " + @current_user.id.to_s)
    #@test = Therapist.not_own_clients(@personal_clients)


  end
end
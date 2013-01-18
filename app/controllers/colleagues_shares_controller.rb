class ColleaguesSharesController < ApplicationController
  before_filter :signed_in_user

  def new
    @colleagues_share = ColleaguesShare.new
    @therapy = Therapy.find(params[:id])
  end

  def create
    params[:colleagues_share][:therapist_id] = @current_user.id
    @new_colleagues_share = ColleaguesShare.create(params[:colleagues_share])

    redirect_to colleagues_share_path(@new_colleagues_share.id)
  end

  def show
    @colleagues_share = ColleaguesShare.find(params[:id])
  end

end
class ClientsController < ApplicationController
  before_filter :signed_in_user

  def index
    @personal_clients = Therapist.find(@current_user.id).clients()
    @other_clients = Therapist.find_by_sql("SELECT C.*
    FROM therapists AS T
    JOIN clients_therapists AS CT ON CT.therapist_id = T.id
    JOIN clients AS C ON C.id=CT.client_id
    WHERE T.id !="+@current_user.id.to_s+"
    AND C.id NOT IN (
                        SELECT sC.id
                        FROM clients AS sC
                        JOIN clients_therapists AS sCT ON sCT.client_id=sC.id
                        JOIN therapists AS sT ON sCT.therapist_id=sT.id
                        WHERE sT.id = "+@current_user.id.to_s+"
                    )")
  end

  def show
      @p = params
  end
end
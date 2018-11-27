class ProfilesController < ApplicationController
  before_filter :authenticate_user!, :json_request_only
  respond_to :json

  RESOURCE = 'profiles'

  def show
    request = get RESOURCE, params, current_user
    respond_with_error unless request.response_code == 200
    profile = request.response_body
    respond_with profile
  end

  def update
    if params[:cancel]
      redirect_to root_path
      return
    end

    put RESOURCE, params, current_user
    head :no_content
  end

  def create
    if params[:cancel]
      redirect_to root_path
      return
    end

    profile = post RESOURCE, params, current_user
    respond_with_error unless profile.response_code == 201

    respond_with do |format|
      format.json { render json: profile.response_body and return}
    end
  end

  def index
    profiles = getAll(RESOURCE, params, current_user).response_body
    respond_with do |format|
      format.json { render json: profiles }
    end
  end

end

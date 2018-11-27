require_relative '../../lib/utils/rest/rest_util'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ::RestUtil

  protected

  def respond_with_error
    respond_with do |format|
      format.json { render status: 400, json: validation_error_as_json }
    end
  end

  #TODO(krish): Temporary error handler. Move it to a more appropriate location and add additional support.
  def validation_error_as_json
    Jbuilder.encode do |json|
      json.error 'Validation Failed'
    end
  end

  def json_request_only
    return if params[:format] == "json" || request.headers["Accept"] =~ /json/
    render :nothing => true, :status => 406
  end

end

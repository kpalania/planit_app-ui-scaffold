require_relative '../../lib/utils/registration_util'

class RegistrationsController < Devise::RegistrationsController
  include RestUtil
  include RegistrationUtil

  RESOURCE = '/users/sign_up'

  def new
    super
  end

  def create
    super
    user = post_with_body RESOURCE, group_as_json('default', [current_user]), current_user
    if user.response_code == 201
      logger.info "successfully registered user: #{user.response_body}"
    else
      logger.info "failed to registered User: #{current_user.email}"
    end
  end

end
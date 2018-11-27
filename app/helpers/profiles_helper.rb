require_relative '../../lib/utils/rest/rest_util'

module ProfilesHelper
  include ::RestUtil

  def profile
    url = '/#profiles'
    response = get_resource_by_email('profiles/user', current_user)
    if response.response_code == 200
      profile_id = JSON.parse(response.response_body)['id']
      url + "/#{profile_id}/edit"
    else
      url + "/new"
    end
  end

end
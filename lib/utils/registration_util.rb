require 'encryptor'
require_relative 'base_util'

module RegistrationUtil
  include ::BaseUtil

  def group_as_json group_name, users
    Jbuilder.encode do |json|
      json.group do
        json.name group_name
        json.users (users) do |user|
          json.mapped_uuid user.uuid
          json.email user.email
        end
      end
    end
  end

end
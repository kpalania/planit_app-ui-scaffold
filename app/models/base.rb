class Base

  FILE_DIRECTORY = 'public/uploads/'

  class << self
    def set_creator current_user
      creator = UserAttribute::Creator.new
      creator.email = current_user.email
      creator.created_on = Time.now.to_s
      creator
    end

    def set_modifier current_user
      modifier = UserAttribute::Modifier.new
      modifier.email = current_user.email
      modifier.modified_on = Time.now.to_s
      modifier
    end
  end

end
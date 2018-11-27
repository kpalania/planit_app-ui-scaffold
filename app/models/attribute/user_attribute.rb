#
# This module contains the Modifier & Creator classes referenced by the Mongoid document models
#
module UserAttribute

  # This class includes the User Metadata related attributes
  class Metadata
    attr_accessor :email

    def mongoize
      {email: email}
    end

    class << self
      def demongoize object
        user = Metadata.new
        unless object.nil?
          user.email = object[:email.to_s]
        end

        user
      end

      def base user, object
        obj = Metadata.demongoize object
        user.email = obj.email
      end
    end
  end

  # This class includes the Modifier related attributes
  class Modifier < Metadata
    attr_accessor :modified_on

    def mongoize
      super.merge(modified_on: modified_on)
    end

    class << self
      def demongoize object
        user = Modifier.new
        unless object.nil?
          base user, object
          user.modified_on = object[:modified_on.to_s]
        end

        user
      end
    end
  end

  # This class includes the Creator related attributes
  class Creator < Metadata
    attr_accessor :created_on

    def mongoize
      super.merge(created_on: created_on)
    end

    class << self
      def demongoize object
        user = Creator.new
        unless object.nil?
          base user, object
          user.created_on = object[:created_on.to_s]
        end

        user
      end
    end
  end

end
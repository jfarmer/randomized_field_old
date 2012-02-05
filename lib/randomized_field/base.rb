module RandomizedField
  module Base
    extend ActiveSupport::Concern

    module ClassMethods


      def randomized_field(field_name, options = {})
        cattr_accessor :randomized_field_name
        cattr_accessor :randomized_field_options

        self.randomized_field_name    = field_name
        self.randomized_field_options = RandomizedField::DEFAULTS.merge(options)

        before_create RandomizedField::Randomizer.new(field_name, self.randomized_field_options)
      end
    end
  end
end

ActiveRecord::Base.send :include, RandomizedField::Base

class Paf
  # Basic attributes that make up a PAF entry
  module Attribute
    def self.included(base)
      base.extend ClassMethods
    end
    private_class_method :included

    # Methods to be added to the including class
    module ClassMethods
      def attrs
        premises_attrs +
          dependent_thoroughfare_attrs +
          thoroughfare_attrs +
          locality_attrs +
          other_attrs
      end

      def premises_attrs
        %i[sub_building_name building_name building_number]
      end

      def dependent_thoroughfare_attrs
        %i[dependent_thoroughfare_name dependent_thoroughfare_descriptor]
      end

      def thoroughfare_attrs
        %i[thoroughfare_name thoroughfare_descriptor]
      end

      def locality_attrs
        %i[double_dependent_locality dependent_locality]
      end

      def other_attrs
        %i[
          organisation_name
          department_name
          po_box_number
          post_town
          postcode
          udprn
        ]
      end
    end
  end
end

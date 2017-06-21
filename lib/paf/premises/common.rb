class Paf
  module Premises
    # Common processing for premises elements of a PAF entry
    module Common
      attr_accessor :concatenation_indicator
      private :concatenation_indicator=

      private

      def concatenate?
        concatenation_indicator == 'Y'
      end

      def sub_name_and_name
        "#{sub_building_name} #{building_name}"
      end

      def number_and_thoroughfare_or_locality
        "#{building_number} #{first_thoroughfare_or_locality}"
      end

      def name_and_thoroughfare_or_locality
        "#{building_name} #{first_thoroughfare_or_locality}"
      end
    end
  end
end

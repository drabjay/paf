class Paf
  module Premises
    # Processing for premises elements of a PAF entry under Rule 5
    module Rule101
      private

      def premises
        return [number_sub_name_and_thoroughfare_or_locality] if concatenate?
        [sub_building_name, number_and_thoroughfare_or_locality]
      end

      def premises_includes_first_thoroughfare_or_locality?
        true
      end

      def number_sub_name_and_thoroughfare_or_locality
        "#{building_number}#{sub_building_name} "\
          "#{first_thoroughfare_or_locality}"
      end
    end
  end
end

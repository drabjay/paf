class Paf
  module Premises
    # Processing for premises elements of a PAF entry under Rule 4
    module Rule011
      private

      def premises
        [building_name, number_and_thoroughfare_or_locality]
      end

      def premises_includes_first_thoroughfare_or_locality?
        true
      end
    end
  end
end

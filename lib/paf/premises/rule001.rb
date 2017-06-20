class Paf
  module Premises
    # Processing for premises elements of a PAF entry under Rule 2
    module Rule001
      private

      def premises
        [number_and_thoroughfare_or_locality]
      end

      def premises_includes_first_thoroughfare_or_locality?
        true
      end
    end
  end
end

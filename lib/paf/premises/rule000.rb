class Paf
  module Premises
    # Processing for premises elements of a PAF entry under Rule 1
    module Rule000
      def premises
        []
      end

      private

      def premises_includes_first_thoroughfare_or_locality?
        false
      end
    end
  end
end

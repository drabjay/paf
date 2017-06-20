class Paf
  module Premises
    # Processing for premises elements of a PAF entry under Rule 7
    module Rule111
      private

      def premises
        return [sub_name_and_name, number_and_thoroughfare_or_locality] if
          sub_building_name.paf_exception?
        [sub_building_name, building_name, number_and_thoroughfare_or_locality]
      end

      def premises_includes_first_thoroughfare_or_locality?
        true
      end
    end
  end
end

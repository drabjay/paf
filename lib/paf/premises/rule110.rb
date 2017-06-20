class Paf
  module Premises
    # Processing for premises elements of a PAF entry under Rule 6
    module Rule110
      private

      def premises
        return [sub_name_and_name] if sub_building_name.paf_exception?
        return [sub_building_name, name_and_thoroughfare_or_locality] if
          building_name.paf_exception?
        [sub_building_name, building_name]
      end

      def premises_includes_first_thoroughfare_or_locality?
        !sub_building_name.paf_exception? && building_name.paf_exception?
      end
    end
  end
end

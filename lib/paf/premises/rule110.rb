module Paf
  module Premises
    # Processing for premises elements of a PAF entry under Rule 6
    module Rule110
      def premises
        return [sub_name_and_name] if sub_building_name.exception?
        return [sub_building_name, name_and_thoroughfare_or_locality] if
          building_name.exception?

        [sub_building_name, building_name]
      end

      private

      def premises_includes_first_thoroughfare_or_locality?
        !sub_building_name.exception? && building_name.exception?
      end
    end
  end
end

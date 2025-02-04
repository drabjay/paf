module Paf
  module Premises
    # Processing for premises elements of a PAF entry under Rule 7
    module Rule111
      def premises
        return [sub_name_comma_name] if building_number.zero?
        return [sub_name_and_name, number_and_thoroughfare_or_locality] if
          sub_building_name.exception?

        [sub_building_name, building_name, number_and_thoroughfare_or_locality]
      end

      private

      def premises_includes_first_thoroughfare_or_locality?
        !building_number.zero?
      end

      def sub_name_comma_name
        "#{sub_building_name}, #{building_name}"
      end
    end
  end
end

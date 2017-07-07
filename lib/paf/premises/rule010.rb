class Paf
  module Premises
    # Processing for premises elements of a PAF entry under Rule 3
    module Rule010
      def premises
        return [name_and_thoroughfare_or_locality] if building_name.exception?
        if building_name.split_exception?
          return [
            building_name.but_last_word,
            name_last_word_and_thoroughfare_or_locality
          ]
        end
        [building_name]
      end

      private

      def premises_includes_first_thoroughfare_or_locality?
        building_name.exception? || building_name.split_exception?
      end

      def name_last_word_and_thoroughfare_or_locality
        "#{building_name.last_word} #{first_thoroughfare_or_locality}"
      end
    end
  end
end

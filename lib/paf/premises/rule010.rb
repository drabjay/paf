class Paf
  module Premises
    # Processing for premises elements of a PAF entry under Rule 3
    module Rule010
      private

      def premises
        return [name_and_thoroughfare_or_locality] if
          building_name.paf_exception?
        if building_name_last_word.paf_split_exception?
          return [
            building_name_but_last_word,
            name_last_word_and_thoroughfare_or_locality
          ]
        end
        [building_name]
      end

      def premises_includes_first_thoroughfare_or_locality?
        building_name.paf_exception? ||
          building_name_last_word.paf_split_exception?
      end

      def building_name_but_last_word
        building_name[0...building_name.rindex(' ')]
      end

      def building_name_last_word
        building_name.split.last
      end

      def name_last_word_and_thoroughfare_or_locality
        "#{building_name_last_word} #{first_thoroughfare_or_locality}"
      end
    end
  end
end

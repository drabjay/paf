module Paf
  module CoreExt
    # Extend the core String class with PAF specific processing
    module String
      def exception?
        !/^(.|[\d][[:alpha:]]|[\d].*?[\d][[:alpha:]]?)$/.match(self).nil?
      end

      def split_exception?
        last_word.exception? && /^\d+$/.match(last_word).nil? && !but_last_word.known_building_type?
      end

      def last_word
        split.last
      end

      def but_last_word
        self[0...rindex(' ')]
      end

      def known_building_type?
        [
          'BACK OF', 'BLOCK', 'BLOCKS', 'BUILDING', 'MAISONETTE', 'MAISONETTES', 'REAR OF',
          'SHOP', 'SHOPS', 'STALL', 'STALLS', 'SUITE', 'SUITES', 'UNIT', 'UNITS'
        ].include?(self)
      end
    end
  end
end

String.include Paf::CoreExt::String

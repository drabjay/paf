module Paf
  module CoreExt
    # Extend the core String class with PAF specific processing
    module String
      def exception?
        !/^(.|[\d][[:alpha:]]|[\d].*?[\d][[:alpha:]]?)$/.match(self).nil?
      end

      def split_exception?
        last_word.exception? && /^\d+$/.match(last_word).nil?
      end

      def last_word
        split.last
      end

      def but_last_word
        self[0...rindex(' ')]
      end
    end
  end
end

String.include Paf::CoreExt::String

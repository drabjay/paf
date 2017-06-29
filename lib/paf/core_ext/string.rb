class Paf
  module CoreExt
    # Extend the core String class with PAF specific processing
    module String
      def paf_exception?
        !/^(.|[\d][[:alpha:]]|[\d].*?[\d][[:alpha:]]?)$/.match(self).nil?
      end

      def paf_split_exception?
        paf_exception? && /^\d+$/.match(self).nil?
      end
    end
  end
end

String.include Paf::CoreExt::String

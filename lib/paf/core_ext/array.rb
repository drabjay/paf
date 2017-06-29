require 'paf/core_ext/string'

class Paf
  module CoreExt
    # Extend the core Array class with PAF specific processing
    module Array
      def condense
        reject(&:vacant?)
      end
    end
  end
end

Array.include Paf::CoreExt::Array

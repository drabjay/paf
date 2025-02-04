require 'paf/core_ext/string'

module Paf
  module CoreExt
    # Extend the core Array class with PAF specific processing
    module Array
      def condense(separator)
        reject(&:vacant?).join(separator)
      end
    end
  end
end

Array.include Paf::CoreExt::Array

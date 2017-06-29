class Paf
  module CoreExt
    # Extend the core Object class with PAF specific processing
    module Object
      def vacant?
        respond_to?(:empty?) ? empty? : !self
      end
    end
  end
end

Object.include Paf::CoreExt::Object

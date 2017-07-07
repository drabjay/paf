class Paf
  # Processing to format PAF entry lines
  module Lineable
    def self.included(base)
      base.extend ClassMethods
    end
    private_class_method :included

    # Methods to be added to the including class
    module ClassMethods
      def lines_methods
        organisation_attrs + %i[po_box premises thoroughfares_and_localities]
      end
    end

    def lines
      lines = []
      self.class.lines_methods.each do |method|
        value = send(method)
        (lines << value).flatten! unless value.vacant?
      end
      lines
    end
  end
end

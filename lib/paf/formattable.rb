require 'paf/premises'
require 'paf/thoroughfare_locality'

class Paf
  # Processing to format a PAF entry
  module Formattable
    def self.included(base)
      base.extend ClassMethods
      base.class_eval do
        include Premises
        include ThoroughfareLocality
      end
    end
    private_class_method :included

    # Methods to be added to the including class
    module ClassMethods
      def lines_methods
        %i[
          organisation_name
          department_name
          po_box
          premises
          thoroughfares_and_localities
        ]
      end

      # Formats a hash of PAF address elements into an array of strings
      def format(args)
        new(args).format
      end

      # Formats a hash of PAF address elements into a string
      def to_s(*args)
        return super if args.empty?
        new(args[0]).to_s
      end
    end

    # Formats a Paf instance into an array of strings
    def format
      array = lines
      %i[post_town postcode].each do |attr|
        array << send(attr) unless send(attr).vacant?
      end
      array
    end

    # Formats a Paf instance into a string
    def to_s
      string = (lines + [post_town]).condense.join(', ')
      ([string] + [postcode]).condense.join('. ')
    end

    private

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

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

      def format(args)
        new(args).format
      end

      def to_s(*args)
        return super if args.empty?
        new(args[0]).to_s
      end
    end

    def format
      array = lines
      %i[post_town postcode].each do |attr|
        array << send(attr) unless send(attr).to_s.empty?
      end
      array
    end

    def to_s
      string = (lines + [post_town.to_s]).reject(&:empty?).join(', ')
      ([string] + [postcode]).reject(&:empty?).join('. ')
    end

    private

    def lines
      lines = []
      self.class.lines_methods.each do |method|
        value = send(method)
        (lines << value).flatten! unless value.nil? || value.empty?
      end
      lines
    end
  end
end

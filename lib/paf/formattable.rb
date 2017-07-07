require 'paf/premises'
require 'paf/thoroughfare_locality'
require 'paf/array_formatter'
require 'paf/hash_formatter'
require 'paf/string_formatter'

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
      # Formats a hash of PAF address elements into an array of strings
      def to_a(args)
        new(args).to_a
      end

      # Formats a hash of PAF address elements into a hash of strings
      def to_h(args)
        new(args).to_h
      end

      # Formats a hash of PAF address elements into a string
      def to_s(*args)
        return super if args.empty?
        new(args[0]).to_s
      end

      alias format to_a
    end

    # Formats a Paf instance into an array of strings
    def to_a
      Paf::ArrayFormatter.format(self)
    end

    # Formats a Paf instance into a hash of strings
    def to_h
      Paf::HashFormatter.format(self)
    end

    # Formats a Paf instance into a string
    def to_s
      Paf::StringFormatter.format(self)
    end

    alias format to_a
  end
end

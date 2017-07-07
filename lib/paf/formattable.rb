require 'paf/premises'
require 'paf/thoroughfare_locality'
require 'paf/array_formatter'
require 'paf/hash_formatter'
require 'paf/string_formatter'

class Paf
  # Processing to format a PAF entry
  module Formattable
    attr_accessor :formatter

    def self.included(base)
      base.prepend Initializer
      base.extend ClassMethods
      base.class_eval do
        include Premises
        include ThoroughfareLocality
      end
    end
    private_class_method :included

    # initialize method to be prepended to the including class
    module Initializer
      def initialize(*)
        super if defined? super
        @formatter ||= Paf::ArrayFormatter.new
      end
    end

    # Methods to be added to the including class
    module ClassMethods
      %i[to_a to_h format].each do |method|
        define_method method do |args|
          new(args).send(method)
        end
      end

      # Formats a hash of PAF address elements into a string
      def to_s(*args)
        return super if args.empty?
        new(args[0]).to_s
      end
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

    # Formats a Paf instance
    def format
      formatter.format(self)
    end
  end
end

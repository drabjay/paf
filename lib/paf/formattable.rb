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

      def to_s(*args)
        return super if args.empty?
        new(args[0]).to_s
      end
    end

    { to_a: :Array, to_h: :Hash, to_s: :String }.each do |key, value|
      define_method key do
        Kernel.const_get("Paf::#{value}Formatter").format(self)
      end
    end

    def format
      formatter.format(self)
    end
  end
end

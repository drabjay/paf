require 'paf/lineable'
require 'paf/premises'
require 'paf/thoroughfare_locality'

class Paf
  # Processing to format a PAF entry
  module Formattable
    def self.included(base)
      base.extend ClassMethods
      base.class_eval do
        include Lineable
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
      array = lines
      self.class.post_attrs.each do |attr|
        array << send(attr) unless send(attr).vacant?
      end
      array
    end

    # Formats a Paf instance into a hash of strings
    def to_h
      hash = {}
      hash[:lines] = lines unless lines.empty?
      hash[:post_town] = post_town unless post_town.vacant?
      hash[:postcode] = postcode unless postcode.vacant?
      hash
    end

    # Formats a Paf instance into a string
    def to_s
      ([(lines + [post_town]).condense(', ')] + [postcode]).condense('. ')
    end

    alias format to_a
  end
end

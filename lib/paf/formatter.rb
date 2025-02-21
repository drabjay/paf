require 'paf/lineable'

module Paf
  # Processing to format a PAF entry
  class Formatter
    def self.format(paf)
      new.format(paf)
    end

    def format(paf)
      @paf = paf.clone
      @paf.extend Lineable
    end

    def method_missing(method, *args)
      return @paf.send(method, *args) if @paf.respond_to?(method)
      return @paf.class.send(method, *args) if @paf.class.respond_to?(method)

      super
    end

    def respond_to_missing?(method_name, include_private = false)
      @paf.respond_to?(method) || @paf.class.respond_to?(method) || super
    end
  end
end

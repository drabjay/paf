require 'paf/formatter'

module Paf
  # Processing to format a PAF entry as an array
  class ArrayFormatter < Formatter
    def format(paf)
      super(paf)
      lines.clone.tap do |array|
        post_attrs.each do |attr|
          array << send(attr) unless send(attr).vacant?
        end
      end
    end
  end
end

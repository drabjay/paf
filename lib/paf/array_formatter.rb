require 'paf/formatter'

class Paf
  # Processing to format a PAF entry as an array
  class ArrayFormatter < Formatter
    def format(paf)
      super(paf)
      array = lines
      post_attrs.each do |attr|
        array << send(attr) unless send(attr).vacant?
      end
      array
    end
  end
end

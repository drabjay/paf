require 'paf/formatter'

class Paf
  # Processing to format a PAF entry as a hash
  class HashFormatter < Formatter
    def format(paf)
      super(paf)
      hash = {}
      ([:lines] + post_attrs).each do |attr|
        hash[attr] = send(attr) unless send(attr).vacant?
      end
      hash
    end
  end
end

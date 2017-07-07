require 'paf/formatter'

class Paf
  # Processing to format a PAF entry as a string
  class StringFormatter < Formatter
    def format(paf)
      super(paf)
      ([(lines + [post_town]).condense(', ')] + [postcode]).condense('. ')
    end
  end
end

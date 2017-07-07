require 'paf/premises'
require 'paf/thoroughfare_locality'

class Paf
  # Processing to format PAF entry lines
  module Lineable
    def self.extended(base)
      base.extend Premises
      base.extend ThoroughfareLocality
    end

    def lines
      lines = []
      lines_methods.each do |method|
        value = send(method)
        (lines << value).flatten! unless value.vacant?
      end
      lines
    end

    private

    def lines_methods
      self.class.organisation_attrs +
        %i[po_box premises thoroughfares_and_localities]
    end
  end
end

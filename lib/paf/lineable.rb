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
      [].tap do |lines|
        lines_methods.each do |method|
          (lines << send(method)).flatten! unless send(method).vacant?
        end
      end
    end

    private

    def lines_methods
      self.class.organisation_attrs +
        %i[po_box premises thoroughfares_and_localities]
    end
  end
end

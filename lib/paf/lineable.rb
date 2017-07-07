class Paf
  # Processing to format PAF entry lines
  module Lineable
    private

    def lines_methods
      organisation_attrs + %i[po_box premises thoroughfares_and_localities]
    end

    def lines
      lines = []
      lines_methods.each do |method|
        value = send(method)
        (lines << value).flatten! unless value.vacant?
      end
      lines
    end
  end
end

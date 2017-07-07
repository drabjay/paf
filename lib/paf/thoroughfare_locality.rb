class Paf
  # Processing for thoroughfare and locality elements of a PAF entry
  module ThoroughfareLocality
    def thoroughfare_and_locality_attrs
      %i[dependent_thoroughfare thoroughfare] + self.class.locality_attrs
    end

    def thoroughfares_and_localities
      array = []
      thoroughfare_and_locality_attrs.each do |attr|
        next if used?(attr)
        value = send(attr)
        array << value unless value.vacant?
      end
      array
    end

    private

    def first_thoroughfare_or_locality
      send(first_thoroughfare_or_locality_attr) unless
        first_thoroughfare_or_locality_attr.nil?
    end

    def first_thoroughfare_or_locality_attr
      thoroughfare_and_locality_attrs.find do |attr|
        !send(attr).vacant?
      end
    end

    def used?(attr)
      premises_includes_first_thoroughfare_or_locality? &&
        (attr == first_thoroughfare_or_locality_attr)
    end
  end
end

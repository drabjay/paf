class Paf
  # Processing for thoroughfare and locality elements of a PAF entry
  module ThoroughfareLocality
    def thoroughfare_and_locality_attrs
      %i[dependent_thoroughfare thoroughfare] + self.class.locality_attrs
    end

    def thoroughfares_and_localities
      [].tap do |array|
        thoroughfare_and_locality_attrs.each do |attr|
          array << send(attr) unless used_or_vacant?(attr)
        end
      end
    end

    private

    def first_thoroughfare_or_locality
      send(first_thoroughfare_or_locality_attr) unless
        first_thoroughfare_or_locality_attr.nil?
    end

    def first_thoroughfare_or_locality_attr
      thoroughfare_and_locality_attrs.find { |attr| !send(attr).vacant? }
    end

    def used?(attr)
      premises_includes_first_thoroughfare_or_locality? &&
        (attr == first_thoroughfare_or_locality_attr)
    end

    def used_or_vacant?(attr)
      used?(attr) || send(attr).vacant?
    end
  end
end

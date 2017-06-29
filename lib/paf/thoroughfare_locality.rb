class Paf
  # Processing for thoroughfare and locality elements of a PAF entry
  module ThoroughfareLocality
    def self.included(base)
      base.extend ClassMethods
    end
    private_class_method :included

    # Methods to be added to the including class
    module ClassMethods
      def thoroughfare_and_locality_attrs
        %i[dependent_thoroughfare thoroughfare] + locality_attrs
      end
    end

    private

    def thoroughfares_and_localities
      array = []
      self.class.thoroughfare_and_locality_attrs.each do |attr|
        next if used?(attr)
        value = send(attr)
        array << value unless value.vacant?
      end
      array
    end

    def first_thoroughfare_or_locality
      send(first_thoroughfare_or_locality_attr) unless
        first_thoroughfare_or_locality_attr.nil?
    end

    def first_thoroughfare_or_locality_attr
      self.class.thoroughfare_and_locality_attrs.find do |attr|
        !send(attr).vacant?
      end
    end

    def used?(attr)
      premises_includes_first_thoroughfare_or_locality? &&
        (attr == first_thoroughfare_or_locality_attr)
    end
  end
end

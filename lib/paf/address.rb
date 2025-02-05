require 'paf/attribute'
require 'paf/formattable'

module Paf
  # Base class from the elements of a UK Royal Mail Postcode Address File entry
  class Address
    include Paf::Attribute
    include Paf::Formattable

    attr_accessor(*attrs)
    private(*attrs.map { |attr| "#{attr}=" }) # rubocop:disable Style/AccessModifierDeclarations

    def initialize(args)
      args.each { |k, v| send("#{k}=", v) }
    end

    # PO Box number prepended with the string PO BOX
    def po_box
      "PO BOX #{po_box_number}" unless po_box_number.vacant?
    end

    # Dependent thoroughfare name and descriptor
    def dependent_thoroughfare
      concatenated(self.class.dependent_thoroughfare_attrs)
    end

    # Thoroughfare name and descriptor
    def thoroughfare
      concatenated(self.class.thoroughfare_attrs)
    end

    private

    def concatenated(attrs)
      value = attrs.map { |attr| send(attr) }.condense(' ')
      value unless value.vacant?
    end
  end
end

require 'paf/version'
require 'paf/attribute'
require 'paf/formattable'
require 'paf/core_ext/string'

# Base class from the elements of a UK Royal Mail Postcode Address File entry
class Paf
  include Paf::Attribute
  include Paf::Formattable

  attr_accessor(*attrs)
  private(*attrs.map { |attr| "#{attr}=" })

  def initialize(args)
    args.each { |k, v| send("#{k}=", v) }
  end

  # PO Box number prepended with the string PO BOX
  def po_box
    "PO BOX #{po_box_number}" unless po_box_number.to_s.empty?
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
    value = attrs.map { |attr| send(attr).to_s }.reject(&:empty?).join(' ')
    value unless value.to_s.empty?
  end
end

require 'paf/premises/string'
require 'paf/premises/common'

class Paf
  # Determine which premises rule is applicable
  module Premises
    include Common

    def self.included(base)
      base.prepend Initializer
    end

    # initialize method to be prepended to the including class
    module Initializer
      def initialize(*)
        super if defined? super
        extend_premises_rule
      end
    end

    private

    def extend_premises_rule
      require premises_rule_filename
      extend premises_rule_module
    end

    def premises_rule_filename
      "paf/premises/rule#{rule_key}"
    end

    def premises_rule_module
      Kernel.const_get("Paf::Premises::Rule#{rule_key}")
    end

    def rule_key
      self.class.premises_attrs.map do |attr|
        send(attr).to_s.empty? ? 0 : 1
      end.join
    end
  end
end
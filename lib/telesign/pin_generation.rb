module Telesign
  # PIN (Person Identification Number) generation.
  #
  # Example:
  #   class Foo
  #     include Telesign::PinGeneration
  #   end
  #   
  #   bar = Foo.new
  #   bar.generate
  #
  module PinGeneration
    # Generates the PIN
    def generate
      base = 10 ** (@pin_length - 1)
      (base + rand((8.9999 * base).floor)).to_s
    end
  end
end
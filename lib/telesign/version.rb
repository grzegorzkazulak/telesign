module Telesign
  module Version
 
    MAJOR = 1
    MINOR = 0
    TINY  = 0
 
    # Returns the version string for the library.
    def self.to_s # :nodoc:
      [MAJOR, MINOR, TINY].join('.')
    end
 
  end
end
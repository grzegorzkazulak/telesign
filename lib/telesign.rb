$:.unshift File.expand_path(File.dirname(__FILE__))

require 'soap/rpc/driver'
require 'telesign/version'
require 'telesign/errors'
require 'telesign/validation'
require 'telesign/pin_generation'
require 'telesign/api'

module Telesign
  TELESIGN_API_URL = 'https://www.telesign.com/api/'
end
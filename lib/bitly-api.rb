$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'httpclient'
require 'json'
require 'bitly-api/bitly-api'

module BitlyApi
  VERSION = '0.1.0'
end

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require 'simplecov'
SimpleCov.start

require_relative "../lib/game"
require_relative "../lib/common_files"

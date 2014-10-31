require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
require 'simplecov'
SimpleCov.start

require_relative '../lib/combo'
require_relative '../lib/common_files'
require_relative '../lib/game'
require_relative '../lib/report'

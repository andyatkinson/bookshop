require 'irb'
require_relative 'bookshop'
Rails.application.initialize!
require 'rails/console/app'
require 'rails/console/helpers'
include Rails::ConsoleMethods
ARGV.clear # Clear ARGV to avoid conflicts with IRB
IRB.start

#!/usr/bin/env ruby
require 'logger'

logger = Logger.new(STDOUT)
logger.level = Logger::DEBUG

# logger.formatter = proc do |severity, datetime, progname, msg|
#   "#{datetime} [#{severity.ljust(6)}] #{msg}\n"
# end

logger.info("Executando el logger...")
logger.debug("Apuntamos los fallos!")

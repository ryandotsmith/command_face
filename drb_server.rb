require 'server'
require 'drb/drb'

server = Server.new
DRb.start_service "druby://10.0.0.195:6000", server
DRb.thread.join

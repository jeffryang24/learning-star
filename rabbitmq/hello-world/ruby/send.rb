#!/usr/bin/env ruby
require 'bunny'

connection = Bunny.new
connection.start

channel = connection.create_channel

# create queue
queue = channel.queue('hello')

# publish message
channel.default_exchange.publish('Hello World!', routing_key: queue.name)

puts " [x] Sent 'Hello World!'"

connection.close
#!/usr/bin/env ruby
require 'bunny'

message = ARGV.empty? ? 'Hello World!' : ARGV.join(' ')

connection = Bunny.new
connection.start

channel = connection.create_channel

# create queue
queue = channel.queue('task_queue', durable: true)

# publish message
#channel.default_exchange.publish(message, routing_key: queue.name)
queue.publish(message, persistent: true)
puts " [x] Sent 'Hello World!'"

connection.close
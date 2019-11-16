#!/usr/bin/env ruby
require 'bunny'

connection = Bunny.new
connection.start

channel = connection.create_channel

queue = channel.queue('task_queue', durable: true)

# Apply qos
channel.prefetch(1);

begin
    puts ' [x] Waiting for messages. To exit press CTRL+C'
    queue.subscribe(manual_ack: true, block: true) do |_delivery_info, _properties, body|
        puts " [x] Received #{body}"
        # imitate some work
        sleep body.count('.').to_i
        channel.ack(_delivery_info.delivery_tag)
        puts ' [x] Done'
    end
rescue Interrupt => _
    connection.close
    exit(0)
end
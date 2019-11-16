#!/usr/bin/env python
import sys
import pika

# Create connection to rabbitmq server
connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

# Create queue unless rabbit will drop our message
channel.queue_declare(queue='task_queue', durable=True)

message = ' '.join(sys.argv[1:]) or "Hello World!"

# Use default exchanger (no name) for first hello world
# routing_key = queue name
channel.basic_publish(
    exchange='',
    routing_key='hello',
    body=message,
    properties=pika.BasicProperties(
        delivery_mode=2
    )
)

print(" [x] Sent %r" % message)

# Close connection
connection.close()
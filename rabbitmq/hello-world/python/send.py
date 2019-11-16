#!/usr/bin/env python
import pika

# Create connection to rabbitmq server
connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

# Create queue unless rabbit will drop our message
channel.queue_declare(queue='hello')

# Use default exchanger (no name) for first hello world
# routing_key = queue name
channel.basic_publish(
    exchange='',
    routing_key='hello',
    body='Hello World!'
)

print(" [x] Sent 'Hello World!'")

# Close connection
connection.close()
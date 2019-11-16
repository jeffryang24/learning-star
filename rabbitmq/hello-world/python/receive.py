#!/usr/bin/env python
import pika

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

# queue_declare is idempotent - so, it will not
# create the same queue again if has been existed.
channel.queue_declare(queue='hello')

def callback(ch, method, properties, body):
    # use decode to remove b'' (bytes literal)
    print(" [x] Received %r" % body.decode('UTF-8'))

# Receive message
channel.basic_consume(
    callback,
    queue='hello',
    no_ack=True
)

print(' [x] Waiting for messages. To exit press CTRL+C')
channel.start_consuming()
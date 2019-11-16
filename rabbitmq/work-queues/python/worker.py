#!/usr/bin/env python
import time
import pika

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

# queue_declare is idempotent - so, it will not
# create the same queue again if has been existed.
channel.queue_declare(queue='task_queue', durable=True)

def callback(ch, method, properties, body):
    # use decode to remove b'' (bytes literal)
    print(" [x] Received %r" % body.decode('UTF-8'))
    time.sleep(body.count(b'.'))
    print(" [x] Done")
    ch.basic_ack(delivery_tag = method.delivery_tag)

channel.basic_qos(prefetch_count=1)

# Receive message
channel.basic_consume(
    callback,
    queue='hello'
)

print(' [x] Waiting for messages. To exit press CTRL+C')
channel.start_consuming()
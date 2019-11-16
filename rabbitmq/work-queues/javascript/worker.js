#!/usr/bin/env node
var amqp = require('amqplib/callback_api');

amqp.connect('amqp://localhost', (err, conn) => {
    conn.createChannel((err, ch) => {
        let queue_name = 'task_queue';

        ch.assertQueue(queue_name, { durable: true });

        console.log(" [x] Waiting for message in %s. To exit press CTRL+C", queue_name);

        // apply qos
        ch.prefetch(1);

        // Receive message
        ch.consume(queue_name, (msg) => {
            let secs = msg.content.toString().split('.').length - 1;
            console.log(" [x] Received %s", msg.content.toString());
            setTimeout(() => {
                console.log(" [x] Done");
                ch.ack(msg);
            }, secs * 1000);
        }, { noAck: false });
    });
});
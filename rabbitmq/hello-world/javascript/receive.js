#!/usr/bin/env node
var amqp = require('amqplib/callback_api');

amqp.connect('amqp://localhost', (err, conn) => {
    conn.createChannel((err, ch) => {
        let queue_name = 'hello';

        ch.assertQueue(queue_name, { durable: false });

        console.log(" [x] Waiting for message in %s. To exit press CTRL+C", queue_name);

        // Receive message
        ch.consume(queue_name, (msg) => {
            console.log(" [x] Received %s", msg.content.toString());
        }, { noAck: true });
    });
});
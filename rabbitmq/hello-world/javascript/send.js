#!/usr/bin/env node
var amqp = require('amqplib/callback_api');

// Connect to the server
amqp.connect('amqp://localhost', (err, conn) => {
    // Create channel
    conn.createChannel((err, ch) => {
        let queue_name = 'hello';

        // Create queue
        ch.assertQueue(queue_name, { durable: false });

        // Send message to queue
        ch.sendToQueue(queue_name, Buffer.from('Hello World!'));
        console.log(" [x] Sent 'Hello World!'");
    });

    setTimeout(() => {
        conn.close();
        process.exit(0);
    }, 500);
});

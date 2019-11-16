#!/usr/bin/env node
var amqp = require('amqplib/callback_api');

// Connect to the server
amqp.connect('amqp://localhost', (err, conn) => {
    // Create channel
    conn.createChannel((err, ch) => {
        let queue_name = 'task_queue';
        let msg = process.argv.slice(2).join(' ') || "Hello World!";

        // Create queue
        ch.assertQueue(queue_name, { durable: true });

        // Send message to queue
        ch.sendToQueue(queue_name, Buffer.from(msg), { persistent: true });
        console.log(" [x] Sent '%s'", msg);
    });

    setTimeout(() => {
        conn.close();
        process.exit(0);
    }, 500);
});

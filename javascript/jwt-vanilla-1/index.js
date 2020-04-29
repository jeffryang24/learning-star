const express = require('express');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');

const { refresh, signIn, welcome } = require('./handlers');

const app = express();
app.use(bodyParser.json());
app.use(cookieParser());

app.post('/signin', signIn);
app.get('/welcome', welcome);
app.post('/refresh', refresh);

app.listen(8080, () => console.log('App is listening at 8080'));

const jwt = require('jsonwebtoken');

const jwtSecretKey = process.env.JWT_KEY;
const jwtExpirySeconds = 30;

const users = {
  user1: 'password1',
  user2: 'password2',
};

module.exports.signIn = function signIn(req, res, next) {
  const { username, password } = req.body;

  if (!username || !password || users[username] !== password) {
    return res.status(401).end();
  }

  const jwtToken = jwt.sign({ username }, jwtSecretKey, {
    algorithm: 'HS256',
    expiresIn: jwtExpirySeconds,
    issuer: 'Stickey Authority',
    subject: 'Stickey Inc',
    audience: 'user',
  });
  console.log(jwtToken);

  res.cookie('jwt', jwtToken, {
    httpOnly: true,
    maxAge: jwtExpirySeconds * 1000,
  });
  res.end();
};

module.exports.welcome = function welcome(req, res, next) {
  const token = req.cookies.jwt;

  if (!token) {
    return res.status(401).end();
  }

  let payload;
  try {
    payload = jwt.verify(token, jwtSecretKey);
  } catch (e) {
    if (e instanceof jwt.JsonWebTokenError) {
      console.error(e);
      return res.status(401).end();
    }

    return res.status(400).end();
  }

  return res.send(`Welcome ${payload.username}`);
};

module.exports.refresh = function refresh(req, res, next) {
  const token = req.cookies.jwt;

  if (!token) {
    return res.status(401).end();
  }

  let payload;
  try {
    payload = jwt.verify(token, jwtSecretKey);
  } catch (e) {
    if (e instanceof jwt.JsonWebTokenError) {
      console.error(e);
      return res.status(401).end();
    }

    return res.status(400).end();
  }

  const nowUnixSeconds = Math.round(Date.now() / 1000);
  if (payload.exp - nowUnixSeconds > 30) {
    return res.status(400).end();
  }

  const newToken = jwt.sign({ username: payload.username }, jwtSecretKey, {
    algorithm: 'HS256',
    expiresIn: jwtExpirySeconds,
    issuer: 'Stickey Authority',
    subject: 'Stickey Inc',
    audience: 'user',
  });
  console.log({ newToken });

  res.cookie('token', newToken, { maxAge: jwtExpirySeconds * 1000 });
  res.end();
};

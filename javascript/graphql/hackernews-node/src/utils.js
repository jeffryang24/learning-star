const jwt = require('jsonwebtoken');
const APP_SECRET = process.env.APP_SECRET;

module.exports = {
  APP_SECRET,
  getUserId: function (context) {
    const authorization = context.request.get('Authorization');
    if (authorization) {
      const token = authorization.replace('Bearer ', '');
      console.log(token);
      const { userId } = jwt.verify(token, APP_SECRET);
      return userId;
    }

    throw new Error('Not Authorized!');
  },
};

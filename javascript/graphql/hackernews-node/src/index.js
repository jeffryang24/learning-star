const { GraphQLServer } = require('graphql-yoga');

const links = [
  {
    id: 'link-0',
    url: 'www.howtographql.com',
    description: 'How to graphql',
  },
];

const resolvers = {
  Query: {
    feed: () => links,
    hello: (_, { name }) => `Hello ${name || 'World'}`,
    info: () => 'Hacker hour',
  },
  Link: {
    id: parent => parent.id,
    description: parent => parent.description,
    url: parent => parent.url,
  },
};

const server = new GraphQLServer({
  resolvers,
  typeDefs: './src/schema.graphql',
});
server.start(() => console.log('Server is running on port 4000'));

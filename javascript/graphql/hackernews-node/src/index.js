const { GraphQLServer } = require('graphql-yoga');

const typeDefs = `
  type Query {
    feed: [Link!]!
    hello(name: String): String!
    info: String!
  }

  type Link {
    description: String!
    id: ID!
    url: String!
  }
`;

const resolvers = {
  Query: {
    hello: (_, { name }) => `Hello ${name || 'World'}`,
    info: () => null,
  },
};

const server = new GraphQLServer({
  resolvers,
  typeDefs,
});
server.start(() => console.log('Server is running on port 4000'));

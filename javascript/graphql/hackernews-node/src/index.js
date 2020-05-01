const { GraphQLServer } = require('graphql-yoga');

const links = [
  {
    id: 'link-0',
    url: 'www.howtographql.com',
    description: 'How to graphql',
  },
];

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
    feed: () => links,
    hello: (_, { name }) => `Hello ${name || 'World'}`,
    info: () => null,
  },
  Link: {
    id: parent => parent.id,
    description: parent => parent.description,
    url: parent => parent.url,
  },
};

const server = new GraphQLServer({
  resolvers,
  typeDefs,
});
server.start(() => console.log('Server is running on port 4000'));

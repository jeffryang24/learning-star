const { GraphQLServer } = require('graphql-yoga');
const { PrismaClient } = require('@prisma/client');

const linkResolvers = require('./resolvers/realdb/link');
const memberResolvers = require('./resolvers/realdb/member');
const mutationResolvers = require('./resolvers/realdb/mutation');
const queryResolvers = require('./resolvers/realdb/query');

const prisma = new PrismaClient();

const resolvers = {
  Query: { ...queryResolvers },
  Mutation: { ...mutationResolvers },
  Link: { ...linkResolvers },
  Member: { ...memberResolvers },
};

const server = new GraphQLServer({
  resolvers,
  context: req => ({ ...req, prisma }),
  typeDefs: './src/schema.graphql',
});
server.start(() => console.log('Server is running on port 4000'));

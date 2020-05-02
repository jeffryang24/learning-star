const { GraphQLServer } = require('graphql-yoga');
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

const resolvers = {
  Query: {
    feed: (_, __, context) => context.prisma.link.findMany({ first: 5 }),
    hello: (_, { name }) => `Hello ${name || 'World'}`,
    info: () => 'Hacker hour',
    // link: (_, { id }) => links.find(link => link.id === id),
  },
  Mutation: {
    post: (_, args, context) => {
      const { url, description } = args;
      return context.prisma.link.create({
        data: {
          url,
          description,
        },
      });
    },
    // updateLink: (_, { id, url, description }) => {
    //   const currentIndex = links.findIndex(link => link.id === id);
    //   if (currentIndex === -1) {
    //     return null;
    //   } else {
    //     const currentLink = links[currentIndex];
    //     const updatedLink = {
    //       ...currentLink,
    //       url: typeof url === 'undefined' ? currentLink.url : url,
    //       description:
    //         typeof description === 'undefined'
    //           ? currentLink.description
    //           : description,
    //     };
    //     const newArray = [
    //       ...links.slice(0, currentIndex),
    //       updatedLink,
    //       ...links.slice(currentIndex + 1),
    //     ];
    //     links = newArray;
    //     return updatedLink;
    //   }
    // },
    // deleteLink: (_, { id }) => {
    //   const willBeDeletedLink = links.find(link => link.id === id);
    //   if (willBeDeletedLink) {
    //     links = links.filter(link => link.id !== id);
    //     return willBeDeletedLink;
    //   }
    //   return null;
    // },
  },
  Link: {
    id: parent => parent.id,
    created_at: parent => parent.created_at,
    description: parent => parent.description,
    url: parent => parent.url,
  },
};

const server = new GraphQLServer({
  resolvers,
  context: { prisma },
  typeDefs: './src/schema.graphql',
});
server.start(() => console.log('Server is running on port 4000'));

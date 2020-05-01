const { GraphQLServer } = require('graphql-yoga');

let links = [
  {
    id: 'link-0',
    url: 'www.howtographql.com',
    description: 'How to graphql',
  },
  {
    id: 'link-1',
    url: 'www.howtographql.com',
    description: 'How to graphql',
  },
  {
    id: 'link-2',
    url: 'www.howtographql.com',
    description: 'How to graphql',
  },
  {
    id: 'link-3',
    url: 'www.howtographql.com',
    description: 'How to graphql',
  },
];
let idCount = links.length;

const resolvers = {
  Query: {
    feed: () => links,
    hello: (_, { name }) => `Hello ${name || 'World'}`,
    info: () => 'Hacker hour',
    link: (_, { id }) => links.find(link => link.id === id),
  },
  Mutation: {
    post: (_, args) => {
      const { url, description } = args;

      const link = {
        id: `link-${idCount++}`,
        url,
        description,
      };
      links.push(link);
      return link;
    },
    updateLink: (_, { id, url, description }) => {
      const currentIndex = links.findIndex(link => link.id === id);
      if (currentIndex === -1) {
        return null;
      } else {
        const currentLink = links[currentIndex];
        const updatedLink = {
          ...currentLink,
          url: typeof url === 'undefined' ? currentLink.url : url,
          description:
            typeof description === 'undefined'
              ? currentLink.description
              : description,
        };
        const newArray = [
          ...links.slice(0, currentIndex),
          updatedLink,
          ...links.slice(currentIndex + 1),
        ];
        links = newArray;
        return updatedLink;
      }
    },
    deleteLink: (_, { id }) => {
      const willBeDeletedLink = links.find(link => link.id === id);
      if (willBeDeletedLink) {
        links = links.filter(link => link.id !== id);
        return willBeDeletedLink;
      }
      return null;
    },
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

module.exports = {
  feed: async (_, __, context) =>
    await context.prisma.link.findMany({ first: 5 }),
  hello: (_, { name }) => `Hello ${name || 'World'}`,
  info: () => 'Hacker hour',
  // link: (_, { id }) => links.find(link => link.id === id),
};

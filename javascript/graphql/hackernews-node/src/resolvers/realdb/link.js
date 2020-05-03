module.exports = {
  id: parent => parent.id,
  created_at: parent => parent.created_at,
  description: parent => parent.description,
  url: parent => parent.url,
  posted_by: async (parent, _, context) => {
    return await context.prisma.link.findMany({
      where: {
        id: {
          equals: parent.id,
        },
      },
      select: {
        posted_by: true,
      },
    });
  },
};
